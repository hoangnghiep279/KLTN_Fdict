const db = require("../config/database");

async function getIngredientsByType() {
  try {
    const [ingredients] = await db.query(
      "SELECT `id`, `name`, `category`, `type` FROM `ingredients`"
    );

    // Nhóm theo `type` chỉ khi `category` và `type` không rỗng
    const grouped = {};
    ingredients.forEach((item) => {
      // Kiểm tra nếu có `category` và `type`
      if (item.category && item.type) {
        if (!grouped[item.type]) {
          grouped[item.type] = [];
        }
        grouped[item.type].push({
          id: item.id,
          name: item.name,
          category: item.category,
        });
      }
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
