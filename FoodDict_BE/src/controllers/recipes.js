const db = require("../config/database");

async function getRecipe(page = 1, limit = 10) {
  try {
    const offset = (page - 1) * limit;

    const [rows] = await db.execute(
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
      LEFT JOIN favorite_recipes f ON r.id = f.recipe_id
      GROUP BY r.id, r.name, r.img_url, r.serving_size, r.cooking_time, 
               r.difficulty
      ORDER BY favorite_count DESC
      LIMIT ? OFFSET ?
    `,
      [limit, offset]
    );

    const [[{ total }]] = await db.execute(`
      SELECT COUNT(*) AS total FROM recipes
    `);

    return {
      code: 200,
      data: rows,
      pagination: {
        currentPage: page, // trang hiện tại
        totalPages: Math.ceil(total / limit), // tổng trang
        totalRecipes: total, //tổng món ăn
      },
    };
  } catch (error) {
    throw error;
  }
}

async function getRecipeById(id) {
  try {
    // Kiểm tra id có hợp lệ không
    if (!id) {
      const error = new Error("Thiếu ID món ăn");
      error.statusCode = 400;
      throw error;
    }

    // Truy vấn thông tin món ăn
    const [recipe] = await db.query(
      `SELECT id, name, img_url, serving_size, cooking_time, difficulty, calories, 
              description, preparation, instructions, usagefood, tips, 
              expert_advice, img_nutrition 
       FROM recipes WHERE id = ?`,
      [id]
    );

    if (recipe.length === 0) {
      const error = new Error("Món ăn không tồn tại!");
      error.statusCode = 404;
      throw error;
    }

    // Truy vấn thành phần món ăn
    const [ingredients] = await db.query(
      `SELECT i.id, i.name, i.category, ri.quantity, ri.unit
       FROM recipe_ingredients ri
       JOIN ingredients i ON ri.ingredient_id = i.id
       WHERE ri.recipe_id = ?`,
      [id]
    );

    return {
      recipe: recipe[0],
      ingredients,
    };
  } catch (error) {
    throw error; // Để router xử lý lỗi
  }
}

module.exports = {
  getRecipe,
  getRecipeById,
};
