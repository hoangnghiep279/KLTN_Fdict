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

module.exports = {
  getMealOfDay,
};
