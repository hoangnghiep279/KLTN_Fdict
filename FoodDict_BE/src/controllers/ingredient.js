const db = require("../config/database");

async function getIngredientsByType() {
  try {
    const [ingredients] = await db.query(
      "SELECT `id`, `name`, `category`, `type` FROM `ingredients`"
    );

    // Nhóm theo `type`
    const grouped = {};
    ingredients.forEach((item) => {
      if (!grouped[item.type]) {
        grouped[item.type] = [];
      }
      grouped[item.type].push({
        id: item.id,
        name: item.name,
        category: item.category,
      });
    });

    return {
      code: 200,
      data: grouped,
    };
  } catch (error) {
    throw error;
  }
}

module.exports = {
  getIngredientsByType,
};
