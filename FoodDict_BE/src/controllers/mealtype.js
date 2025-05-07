const db = require("../config/database");

async function getMealType() {
  try {
    const [mealTypes] = await db.query("SELECT * FROM `meal_type`");
    return {
      code: 200,
      data: mealTypes,
    };
  } catch (error) {
    throw error;
  }
}

async function getAllMealTypesWithRecipes() {
  try {
    // Lấy tất cả các loại bữa ăn
    const [mealTypes] = await db.execute(`SELECT id, name FROM meal_type`);

    // Duyệt qua từng loại, lấy danh sách món ăn tương ứng
    const results = await Promise.all(
      mealTypes.map(async (meal) => {
        const [recipes] = await db.execute(
          `
          SELECT 
            r.id,
            r.name,
            r.img_url,
            r.serving_size,
            r.cooking_time,
            r.difficulty,
            COUNT(f.recipe_id) AS favorite_count
          FROM recipes r
          JOIN recipe_meal_types rmt ON r.id = rmt.recipe_id
          LEFT JOIN favorite_recipes f ON r.id = f.recipe_id
          WHERE rmt.mealtype_id = ?
          GROUP BY r.id, r.name, r.img_url, r.serving_size, r.cooking_time, r.difficulty
          ORDER BY favorite_count DESC
        `,
          [meal.id]
        );

        return {
          id: meal.id,
          name: meal.name,
          recipes,
        };
      })
    );

    return {
      code: 200,
      data: results,
    };
  } catch (error) {
    console.error("Error in getAllMealTypesWithRecipes:", error);
    throw error;
  }
}


async function insertMealType(mealtype) {
  try {
    const [name] = await db.query(
      `SELECT id, name FROM meal_type WHERE name = ?`,
      [mealtype.name]
    );

    if (name.length > 0) {
      const err = new Error("Dinh dưỡng đã tồn tại!");
      err.statusCode = 401;
      throw err;
    }

    await db.query(
      `INSERT INTO \`meal_type\`(\`id\`, \`name\`) VALUES (uuid(), ? )`,
      [mealtype.name]
    );
    return {
      code: 200,
      message: "thêm loại dinh dưỡng thành công",
    };
  } catch (error) {
    throw error;
  }
}

async function updateMealType(id, mealtype) {
  try {
    const [rows] = await db.query(`SELECT * FROM meal_type WHERE id = ?`, [id]);

    await db.query(`UPDATE meal_type SET name= ? WHERE id = ?`, [
      mealtype.name,
      id,
    ]);
    return {
      data: [rows],
      code: 200,
      message: "Sửa thành công",
    };
  } catch (error) {
    throw error;
  }
}
async function deleteMealType(id) {
  try {
    await db.query(`DELETE FROM recipe_meal_types WHERE mealtype_id = ?`, [id]);

    await db.query(`DELETE FROM meal_type WHERE id = ?`, [id]);

    return {
      code: 200,
      message: "Xóa thành công",
    };
  } catch (error) {
    throw error;
  }
}

module.exports = {
  getMealType,
  getAllMealTypesWithRecipes,
  insertMealType,
  updateMealType,
  deleteMealType,
};
