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
async function insertMealType(mealtype) {
  try {
    const [name] = await db.query(
      `SELECT id, name FROM meal_type WHERE name = ?`,
      [mealtype.name]
    );

    if (name.length > 0) {
      const err = new Error("Dinh dưỡng đã tồn tại!");
      err.statusCode = 401;
      throw err;
    }

    await db.query(
      `INSERT INTO \`meal_type\`(\`id\`, \`name\`) VALUES (uuid(), ? )`,
      [mealtype.name]
    );
    return {
      code: 200,
      message: "thêm loại dinh dưỡng thành công",
    };
  } catch (error) {
    throw error;
  }
}

async function updateMealType(id, mealtype) {
  try {
    const [rows] = await db.query(`SELECT * FROM meal_type WHERE id = ?`, [id]);

    await db.query(`UPDATE meal_type SET name= ? WHERE id = ?`, [
      mealtype.name,
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
async function deleteMealType(id) {
  try {
    await db.query(`DELETE FROM recipe_meal_types WHERE mealtype_id = ?`, [id]);

    await db.query(`DELETE FROM meal_type WHERE id = ?`, [id]);

    return {
      code: 200,
      message: "Xóa thành công",
    };
  } catch (error) {
    throw error;
  }
}

module.exports = {
  getMealType,
  insertMealType,
  updateMealType,
  deleteMealType,
};
