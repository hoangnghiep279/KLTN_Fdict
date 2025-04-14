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
async function insertCookMethod(cookMethod) {
  try {
    const [name] = await db.query(
      `SELECT id, name FROM cooking_methods WHERE name = ?`,
      [cookMethod.name]
    );

    if (name.length > 0) {
      const err = new Error("Phương thức nấu ăn đã tồn tại!");
      err.statusCode = 401;
      throw err;
    }

    await db.query(
      `INSERT INTO \`cooking_methods\`(\`id\`, \`name\`) VALUES (uuid(), ? )`,
      [cookMethod.name]
    );
    return {
      code: 200,
      message: "thêm loại Phương thức nấu ăn thành công",
    };
  } catch (error) {
    throw error;
  }
}

async function updateCookMethod(id, cookMethod) {
  try {
    const [rows] = await db.query(
      `SELECT * FROM cooking_methods WHERE id = ?`,
      [id]
    );

    await db.query(`UPDATE cooking_methods SET name= ? WHERE id = ?`, [
      cookMethod.name,
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
async function deleteCookMethod(id) {
  try {
    await db.query(
      `DELETE FROM recipe_cooking_methods WHERE cooking_method_id = ?`,
      [id]
    );

    await db.query(`DELETE FROM cooking_methods WHERE id = ?`, [id]);

    return {
      code: 200,
      message: "Xóa thành công",
    };
  } catch (error) {
    throw error;
  }
}

module.exports = {
  getCookMethod,
  insertCookMethod,
  updateCookMethod,
  deleteCookMethod,
};
