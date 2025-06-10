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

async function getListUser(page = 1, limit = 10, search = "") {
  try {
    const offset = (page - 1) * limit;
    const searchQuery = `%${search}%`;

    let query = `
      SELECT
        id,
        \`name\`,
        \`created_at\`,
        \`gender\`,
        \`banned_until\`
      FROM \`user\`
      WHERE permission_id = 2
    `;
    const params = [];

    if (search) {
      query += ` AND \`name\` LIKE ? `;
      params.push(searchQuery);
    }

    query += ` ORDER BY \`created_at\` DESC LIMIT ? OFFSET ?`;
    params.push(limit, offset);

    const [rows] = await db.execute(query, params);

    // Lấy tổng số bản ghi
    const countQuery = search
      ? `SELECT COUNT(*) AS total FROM \`user\` WHERE permission_id = 2 AND \`name\` LIKE ?`
      : `SELECT COUNT(*) AS total FROM \`user\` WHERE permission_id = 2`;

    const [countResult] = await db.execute(
      countQuery,
      search ? [searchQuery] : []
    );

    const total = countResult[0].total;

    return {
      code: 200,
      data: rows,
      pagination: {
        currentPage: page,
        totalPages: Math.ceil(total / limit),
        totalUsers: total,
      },
    };
  } catch (error) {
    throw error;
  }
}

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

    // Kiểm tra nếu đang bị ban
    if (rows.banned_until && new Date(rows.banned_until) > new Date()) {
      const error = new Error(
        `Tài khoản đã bị khóa đến ${new Date(
          rows.banned_until
        ).toLocaleString()}.`
      );
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
      const error = new Error("Thông tin tài khoản không tồn tại!");
      error.statusCode = 401;
      throw error;
    }

    if (rows.permission_id !== 1) {
      const error = new Error("Bạn không có quyền truy cập!");
      error.statusCode = 403;
      throw error;
    }

    const isPasswordMatch = await comparePassword(user.password, rows.password);
    if (!isPasswordMatch) {
      const error = new Error(
        "Thông tin tài khoản hoặc mật khẩu không chính xác!"
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
    // Kiểm tra thông tin bắt buộc
    if (user.name == null) {
      const error = new Error("Bạn cần nhập tên của bạn!");
      error.statusCode = 401;
      throw error;
    }

    // Kiểm tra xem user có tồn tại chưa
    const [rows] = await db.execute(
      `SELECT \`avatar\` FROM \`user\` WHERE \`id\` = ?`,
      [userId]
    );

    if (rows.length === 0) {
      throw new Error("Người dùng không tồn tại!");
    }

    const currentAvatar = rows[0].avatar;
    let avatarUrl = currentAvatar;

    // Nếu có file ảnh mới
    if (file) {
      const uploadResult = await uploadSingleImage(file);
      avatarUrl = uploadResult.image;

      // Xóa ảnh cũ nếu không phải avatar mặc định
      if (currentAvatar !== "resources/default-avatar.png") {
        const currentAvatarPath = path.join(__dirname, "../", currentAvatar);

        if (fs.existsSync(currentAvatarPath)) {
          await fs.promises.unlink(currentAvatarPath);
        }
      }
    }

    // Check trùng email với user khác
    if (user.email) {
      const [emailCheck] = await db.execute(
        `SELECT id FROM user WHERE email = ? AND id != ?`,
        [user.email, userId]
      );

      if (emailCheck.length > 0) {
        const error = new Error("Email đã được sử dụng bởi tài khoản khác!");
        error.statusCode = 400;
        throw error;
      }
    }

    // Update thông tin người dùng
    await db.execute(
      `UPDATE \`user\`
       SET \`name\` = ?, \`gender\` = ?, \`email\` = ?, \`avatar\` = ?, \`birthday\` =?
       WHERE \`id\` = ?`,
      [
        user.name,
        user.gender ?? null,
        user.email,
        avatarUrl,
        user.birthday,
        userId,
      ]
    );

    return {
      code: 200,
      message: "Cập nhật thông tin thành công!",
    };
  } catch (error) {
    throw error;
  }
}

async function banUser(userId, user) {
  if (!userId || !user.days) {
    return {
      code: 400,
      message: "Thiếu userId hoặc số ngày ban.",
    };
  }

  try {
    // Lấy thông tin người dùng từ DB để lấy tên
    const [users] = await db.query(
      `SELECT name FROM \`user\` WHERE id = ? AND permission_id = 2`,
      [userId]
    );

    if (users.length === 0) {
      return {
        code: 404,
        message: "Không tìm thấy người dùng hoặc không thể ban admin.",
      };
    }

    const userName = users[0].name;

    const [result] = await db.query(
      `UPDATE \`user\`
      SET banned_until = DATE_ADD(NOW(), INTERVAL ? DAY)
      WHERE id = ? AND permission_id = 2`,
      [user.days, userId]
    );

    return {
      code: 200,
      message: `Đã ban người dùng ${userName} trong ${user.days} ngày.`,
      name: userName,
    };
  } catch (error) {
    throw error;
  }
}

async function unbanUser(userId, user) {
  if (!userId || !user.name) {
    return {
      code: 400,
      message: "Thiếu userId hoặc tên người dùng.",
    };
  }

  try {
    const [result] = await db.query(
      `UPDATE \`user\` SET banned_until = NULL WHERE id = ? AND permission_id = 2`,
      [userId]
    );

    if (result.affectedRows === 0) {
      return {
        code: 404,
        message: "Không tìm thấy người dùng hoặc không thể bỏ ban admin.",
      };
    }

    return {
      code: 200,
      message: `Đã bỏ ban người dùng ${user.name}.`,
    };
  } catch (error) {
    throw error;
  }
}

async function changePassword(id, user) {
  try {
    if (!user.password || user.password.trim() === "") {
      const error = new Error("Hãy nhập mật khẩu hiện tại của bạn!");
      error.statusCode = 400;
      throw error;
    }

    if (!user.newPassword || user.newPassword.trim() === "") {
      const error = new Error("Mật khẩu mới không được để trống!");
      error.statusCode = 400;
      throw error;
    }

    // Truy vấn lấy mật khẩu cũ từ cơ sở dữ liệu
    const [[rows]] = await db.execute(
      `SELECT \`password\` FROM \`user\` WHERE \`id\` = ?`,
      [id]
    );

    if (!rows) {
      const error = new Error("Người dùng không tồn tại!");
      error.statusCode = 404;
      throw error;
    }

    // So sánh mật khẩu hiện tại
    const isPasswordMatch = await comparePassword(user.password, rows.password);
    if (!isPasswordMatch) {
      const error = new Error("Mật khẩu cũ không chính xác!");
      error.statusCode = 401;
      throw error;
    }

    // Băm mật khẩu mới
    const hashedPassword = await hashPassword(user.newPassword);

    // Cập nhật mật khẩu mới
    await db.execute(`UPDATE \`user\` SET \`password\` = ? WHERE \`id\` = ?`, [
      hashedPassword,
      id,
    ]);

    return {
      code: 200,
      message: "Mật khẩu đã được thay đổi!",
    };
  } catch (error) {
    throw error;
  }
}

module.exports = {
  getListUser,
  register,
  adminLogin,
  userLogin,
  getUserById,
  banUser,
  unbanUser,
  changePassword,
  updateUser,
};
