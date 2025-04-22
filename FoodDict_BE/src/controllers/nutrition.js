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
  getRecipesByNutritionNeed,
  insertNutrition,
  updateNutrition,
  deleteNutrition,
};
