const db = require("../config/database");

async function getCookMethod() {
  try {
    const [cookMethod] = await db.query("SELECT * FROM `cooking_methods`");
    return {
      code: 200,
      data: cookMethod,
    };
  } catch (error) {
    throw error;
  }
}

module.exports = {
  getCookMethod,
};
