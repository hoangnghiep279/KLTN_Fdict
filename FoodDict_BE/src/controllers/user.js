require("dotenv").config();
const db = require("../config/database.js");
const crypto = require("crypto");
const fs = require("fs");
const path = require("path");
const { signToken } = require("../helpers/token.js");
const { validateEmail } = require("../validations/validateEmail");
const {
  hashPassword,
  comparePassword,
} = require("../helpers/bcriptPassword.js");
const uploadSingleImage = require("../helpers/uploadimg").uploadSingleImage;

async function register(user) {
  try {
    if (!user.name || user.name.trim() === "") {
      const err = new Error("Bạn cần có một cái tên!");
      err.statusCode = 400;
      throw err;
    }

    if (!validateEmail(user.email)) {
      const err = new Error("Email không hợp lệ!");
      err.statusCode = 400;
      throw err;
    }

    const [email] = await db.execute(
      `SELECT email FROM \`user\` WHERE \`email\` = ?`,
      [user.email]
    );

    if (email.length > 0) {
      const err = new Error("Email đã tồn tại!");
      err.statusCode = 401;
      throw err;
    }

    const [name] = await db.execute(
      `SELECT name FROM \`user\` WHERE \`name\` = ?`,
      [user.name]
    );
    if (name.length > 0) {
      const err = new Error("Tên người dùng đã tồn tại!");
      err.statusCode = 401;
      throw err;
    }

    const hashedPassword = await hashPassword(user.password);

    // Chèn vào bảng `user`
    await db.execute(
      `INSERT INTO \`user\`(
            \`id\`,
            \`permission_id\`,
            \`name\`,
            \`email\`,
            \`password\`,
            \`gender\`,
            \`birthday\`,
            \`avatar\`
      )
      VALUES(
            uuid(),             
            2,              
            ?,              
            ?, 
            ?, 
            ?,  
            ?,
            'resources/default-avatar.png'
      );`,
      [
        user.name,
        user.email,
        hashedPassword,
        user.gender,
        new Date(user.birthday).toISOString().split("T")[0],
      ]
    );

    return {
      code: 200,
      message: "Đăng ký tài khoản thành công!",
    };
  } catch (error) {
    throw error;
  }
}

async function userLogin(user) {
  try {
    const [[rows]] = await db.execute(
      `SELECT * FROM \`user\` WHERE \`email\` = ?`,
      [user.email]
    );

    if (!rows) {
      const error = new Error("Thông tin tài khoản không tồn tại!");
      error.statusCode = 401;
      throw error;
    }

    if (rows.permission_id !== 2) {
      const error = new Error("Bạn không có quyền truy cập!");
      error.statusCode = 403;
      throw error;
    }

    const isPasswordMatch = await comparePassword(user.password, rows.password);
    if (!isPasswordMatch) {
      const error = new Error(
        "Thông tin tài khoản hoặc mật khâ̂u không chính xác!"
      );
      error.statusCode = 401;
      throw error;
    }

    const id = rows.id;
    const token = await signToken(id);
    return {
      code: 200,
      data: {
        id: rows.id,
        name: rows.name,
        email: rows.email,
        permission: rows.permission_id,
        token,
      },
    };
  } catch (error) {
    throw error;
  }
}

async function adminLogin(user) {
  try {
    const [[rows]] = await db.execute(
      `SELECT * FROM \`user\` WHERE \`email\` = ?`,
      [user.email]
    );

    if (!rows) {
      const error = new Error("Thông tin tài khoản không tồn tại!");
      error.statusCode = 401;
      throw error;
    }

    if (rows.permission_id !== 1) {
      const error = new Error("Bạn không có quyền truy cập!");
      error.statusCode = 403;
      throw error;
    }

    const isPasswordMatch = await comparePassword(user.password, rows.password);
    if (!isPasswordMatch) {
      const error = new Error(
        "Thông tin tài khoản hoặc mật khẩu không chính xác!"
      );
      error.statusCode = 401;
      throw error;
    }

    const id = rows.id;
    const token = await signToken(id);
    return {
      code: 200,
      data: {
        id: rows.id,
        name: rows.name,
        email: rows.email,
        permission: rows.permission_id,
        token,
      },
    };
  } catch (error) {
    throw error;
  }
}

async function getUserById(userId) {
  try {
    const [rows] = await db.execute(
      `SELECT
          \`id\`,
          \`name\`,
          \`email\`,
          \`gender\`,
          \`birthday\`,
          \`avatar\`
        FROM
          \`user\` WHERE id = '${userId}'`
    );
    if (rows.length === 0) {
      throw new Error("Người dùng không tồn tại");
    }
    return rows[0];
  } catch (error) {
    throw error;
  }
}

async function updateUser(userId, user, file) {
  try {
    // Kiểm tra các trường thông tin người dùng
    if (user.name == null) {
      const error = new Error("Bạn cần nhập tên của bạn!");
      error.statusCode = 401;
      throw error;
    }

    const [rows] = await db.execute(
      `SELECT \`avatar\` FROM \`user\` WHERE \`id\` = ?`,
      [userId]
    );

    if (rows.length === 0) {
      throw new Error("Người dùng không tồn tại!");
    }

    const currentAvatar = rows[0].avatar;
    let avatarUrl = currentAvatar;

    if (file) {
      const uploadResult = await uploadSingleImage(file);
      avatarUrl = uploadResult.image;

      if (currentAvatar !== "resources/default-avatar.png") {
        const currentAvatarPath = path.join(__dirname, "../", currentAvatar);

        if (fs.existsSync(currentAvatarPath)) {
          await fs.promises.unlink(currentAvatarPath);
        }
      }
    }
    await db.execute(
      `
      UPDATE \`user\`
      SET
        \`name\` = '${user.name}',
        \`gender\` = ${user.gender ?? null},
        \`email\` = '${user.email}',
        \`avatar\` = '${avatarUrl}'
      WHERE \`id\` = '${userId}'
      `
    );

    return {
      code: 200,
      message: "Cập nhật thông tin thành công!",
    };
  } catch (error) {
    throw error;
  }
}

// async function changePassword(id, user) {
//   try {
//     if (!user.password || user.password.trim() === "") {
//       const error = new Error("Hãy nhập mật khẩu hiện tại của bạn!");
//       error.statusCode = 400;
//       throw error;
//     }

//     if (!user.newPassword || user.newPassword.trim() === "") {
//       const error = new Error("Mật khẩu mới không được để trống!");
//       error.statusCode = 400;
//       throw error;
//     }

//     // Truy vấn lấy mật khẩu cũ từ cơ sở dữ liệu
//     const [[rows]] = await db.execute(
//       `SELECT \`password\` FROM \`user\` WHERE \`id\` = ?`,
//       [id]
//     );

//     if (!rows) {
//       const error = new Error("Người dùng không tồn tại!");
//       error.statusCode = 404;
//       throw error;
//     }

//     // So sánh mật khẩu hiện tại
//     const isPasswordMatch = await comparePassword(user.password, rows.password);
//     if (!isPasswordMatch) {
//       const error = new Error("Mật khẩu cũ không chính xác!");
//       error.statusCode = 401;
//       throw error;
//     }

//     // Băm mật khẩu mới
//     const hashedPassword = await hashPassword(user.newPassword);

//     // Cập nhật mật khẩu mới
//     await db.execute(`UPDATE \`user\` SET \`password\` = ? WHERE \`id\` = ?`, [
//       hashedPassword,
//       id,
//     ]);

//     return {
//       code: 200,
//       message: "Mật khẩu đã được thay đổi!",
//     };
//   } catch (error) {
//     throw error;
//   }
// }

// async function deleteUser(id) {
//   try {
//     await db.execute("START TRANSACTION");

//     await db.execute(
//       `DELETE FROM \`cart\`
//        WHERE \`user_id\` = ?`,
//       [id]
//     );

//     const [result] = await db.execute(
//       `DELETE FROM \`user\`
//        WHERE \`id\` = ?`,
//       [id]
//     );

//     if (result.affectedRows === 0) {
//       const err = new Error("Người dùng không tồn tại!");
//       err.statusCode = 404;
//       throw err;
//     }

//     await db.execute("COMMIT");

//     return {
//       code: 200,
//       message: "Đã xoá người dùng thành công!",
//     };
//   } catch (error) {
//     await db.execute("ROLLBACK");
//     throw error;
//   }
// }

module.exports = {
  register,
  adminLogin,
  userLogin,
  getUserById,
  // changePassword,
  updateUser,
  // deleteUser,
};
