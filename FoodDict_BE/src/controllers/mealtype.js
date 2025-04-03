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

module.exports = {
  getMealType,
};
