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

module.exports = {
  getNutrition,
};
