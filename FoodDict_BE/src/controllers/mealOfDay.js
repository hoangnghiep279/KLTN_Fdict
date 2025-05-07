const db = require("../config/database");

async function getMealOfDay() {
  try {
    const [mealOfday] = await db.query("SELECT * FROM `meal_categories`");
    return {
      code: 200,
      data: mealOfday,
    };
  } catch (error) {
    throw error;
  }
}

async function getAllMealOfDayWithRecipes() {
  try {
    // Lấy tất cả các loại bữa ăn
    const [mealCategory] = await db.execute(`SELECT id, name FROM meal_categories`);

    // Duyệt qua từng loại, lấy danh sách món ăn tương ứng
    const results = await Promise.all(
      mealCategory.map(async (meal) => {
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
          JOIN recipe_meal_categories rmc ON r.id = rmc.recipe_id
          LEFT JOIN favorite_recipes f ON r.id = f.recipe_id
          WHERE rmc.meal_category_id = ?
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
    console.error("Error in getAllMealOfDayWithRecipes:", error);
    throw error;
  }
}

module.exports = {
  getMealOfDay,getAllMealOfDayWithRecipes
};
