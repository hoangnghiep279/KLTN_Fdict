const db = require("../config/database");

async function getUserMealPlans(userId) {
  try {
    const [mealPlans] = await db.query(
      `SELECT 
        user_meal_plans.id, 
        user_meal_plans.menu_number, 
        user_meal_plans.meal_time, 
        recipes.name AS recipe_name,
        recipes.img_url AS recipe_img,
        recipes.id AS recipe_id
      FROM user_meal_plans
      LEFT JOIN recipes ON user_meal_plans.recipe_id = recipes.id
      WHERE user_meal_plans.user_id = ? 
      ORDER BY user_meal_plans.menu_number, user_meal_plans.meal_time`,
      [userId]
    );
    return {
      code: 200,
      data: mealPlans,
    };
  } catch (error) {
    throw error;
  }
}
async function addMealPlan(userId, mealPlans) {
  const conn = await db.getConnection();
  await conn.beginTransaction();

  try {
    const insertQuery = `
      INSERT INTO user_meal_plans (id, user_id, recipe_id, menu_number, meal_time)
      VALUES (uuid(), ?, ?, ?, ?)`;

    for (const plan of mealPlans) {
      // Xóa trước nếu đã tồn tại bản ghi cũ cho ngày + buổi ăn này
      await conn.query(
        `DELETE FROM user_meal_plans WHERE user_id = ? AND menu_number = ? AND meal_time = ?`,
        [userId, plan.menuNumber, plan.mealTime]
      );

      // Thêm bản ghi mới
      await conn.query(insertQuery, [
        userId,
        plan.recipeId,
        plan.menuNumber,
        plan.mealTime,
      ]);
    }

    await conn.commit();
    conn.release();
    return { code: 201, message: "Meal plans added successfully" };
  } catch (error) {
    await conn.rollback();
    conn.release();
    throw error;
  }
}

async function deleteMealPlan(userId, mealPlanId) {
  try {
    const [result] = await db.query(
      `DELETE FROM user_meal_plans WHERE id = ? AND user_id = ?`,
      [mealPlanId, userId]
    );

    if (result.affectedRows === 0) {
      return { code: 404, message: "Không tìm thấy bữa ăn để xóa." };
    }

    return { code: 200, message: "Xóa bữa ăn thành công." };
  } catch (error) {
    throw error;
  }
}

async function searchRecipes(keyword) {
  try {
    const [results] = await db.query(
      `SELECT id, name, img_url, serving_size, cooking_time, difficulty, view_count
       FROM recipes
       WHERE status = 1 AND name LIKE ?
       LIMIT 20`,
      [`%${keyword}%`]
    );
    return { code: 200, data: results };
  } catch (error) {
    throw error;
  }
}

async function getSuggestedRecipes() {
  try {
    const [results] = await db.query(
      `SELECT id, name, img_url, serving_size, cooking_time, difficulty, view_count
       FROM recipes
       WHERE status = 1
       ORDER BY view_count DESC
       LIMIT 15`
    );
    return { code: 200, data: results };
  } catch (error) {
    throw error;
  }
}

module.exports = {
  getUserMealPlans,
  addMealPlan,
  deleteMealPlan,
  searchRecipes,
  getSuggestedRecipes,
};
