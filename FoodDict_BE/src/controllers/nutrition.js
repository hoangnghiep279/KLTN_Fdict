const db = require("../config/database");

async function getNutrition() {
  try {
    const [nutrition] = await db.query("SELECT * FROM `nutrition_needs`");
    return {
      code: 200,
      data: nutrition,
    };
  } catch (error) {
    throw error;
  }
}

async function getAllNutritionWithRecipes() {
  try {
    // Lấy tất cả các loại bữa ăn
    const [nutritionRecipe] = await db.execute(`SELECT id, name FROM nutrition_needs`);

    // Duyệt qua từng loại, lấy danh sách món ăn tương ứng
    const results = await Promise.all(
      nutritionRecipe.map(async (nutrition) => {
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
          JOIN recipe_nutrition_needs rmc ON r.id = rmc.recipe_id
          LEFT JOIN favorite_recipes f ON r.id = f.recipe_id
          WHERE rmc.nutrition_needs_id = ?
          GROUP BY r.id, r.name, r.img_url, r.serving_size, r.cooking_time, r.difficulty
          ORDER BY favorite_count DESC
        `,
          [nutrition.id]
        );

        return {
          id: nutrition.id,
          name: nutrition.name,
          recipes,
        };
      })
    );

    return {
      code: 200,
      data: results,
    };
  } catch (error) {
    console.error("Error in getAllNutritionWithRecipes:", error);
    throw error;
  }
}

// controller.js
async function getRecipesByNutritionNeed(nutritionNeedId) {
  try {
    const [recipes] = await db.query(
      `
      SELECT r.*
      FROM recipes r
      JOIN recipe_nutrition_needs rn ON r.id = rn.recipe_id
      WHERE rn.nutrition_needs_id = ?
    `,
      [nutritionNeedId]
    );

    return {
      code: 200,
      data: recipes,
    };
  } catch (error) {
    throw error;
  }
}

async function insertNutrition(nutrition) {
  try {
    const [name] = await db.query(
      `SELECT id, name FROM nutrition_needs WHERE name = ?`,
      [nutrition.name]
    );

    if (name.length > 0) {
      const err = new Error("Dinh dưỡng đã tồn tại!");
      err.statusCode = 401;
      throw err;
    }

    await db.query(
      `INSERT INTO \`nutrition_needs\`(\`id\`, \`name\`) VALUES (uuid(), ? )`,
      [nutrition.name]
    );
    return {
      code: 200,
      message: "thêm loại dinh dưỡng thành công",
    };
  } catch (error) {
    throw error;
  }
}

async function updateNutrition(id, nutrition) {
  try {
    const [rows] = await db.query(
      `SELECT * FROM nutrition_needs WHERE id = ?`,
      [id]
    );

    await db.query(`UPDATE nutrition_needs SET name= ? WHERE id = ?`, [
      nutrition.name,
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
async function deleteNutrition(id) {
  try {
    await db.query(
      `DELETE FROM recipe_nutrition_needs WHERE nutrition_needs_id = ?`,
      [id]
    );

    await db.query(`DELETE FROM nutrition_needs WHERE id = ?`, [id]);

    return {
      code: 200,
      message: "Xóa thành công",
    };
  } catch (error) {
    throw error;
  }
}
module.exports = {
  getNutrition,
  getAllNutritionWithRecipes,
  getRecipesByNutritionNeed,
  insertNutrition,
  updateNutrition,
  deleteNutrition,
};
