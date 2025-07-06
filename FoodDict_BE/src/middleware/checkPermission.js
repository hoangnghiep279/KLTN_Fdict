const db = require("../config/database.js");

// User
const checkMyAccount = async (req, res, next) => {
  try {
    if (req.payload.id != req.params.id) {
      var err = new Error("User không hợp lệ!");
      err.statusCode = 401;
      next(err);
    }
    next();
  } catch (error) {
    next(error);
  }
};

const checkAdmin = async (req, res, next) => {
  try {
    const [result] = await db.execute(
      `SELECT permission_id
            FROM \`user\`
            WHERE \`id\` = '${req.payload.id}'`
    );

    if (result.length === 0) {
      const err = new Error("Người dùng không tồn tại!");
      err.statusCode = 404;
      return next(err);
    }
    if (result[0].permission_id !== 1) {
      const err = new Error("Bạn không có quyền thực hiện thao tác này!");
      err.statusCode = 403;
      return next(err);
    }
    next();
  } catch (error) {
    next(error);
  }
};
const checkUser = async (req, res, next) => {
  try {
    const [result] = await db.execute(
      `SELECT permission_id
            FROM \`user\`
            WHERE \`id\` = '${req.payload.id}'`
    );

    if (result.length === 0) {
      const err = new Error("Người dùng không tồn tại!");
      err.statusCode = 404;
      return next(err);
    }
    if (result[0].permission_id !== 2) {
      const err = new Error("Bạn không có quyền thực hiện thao tác này!");
      err.statusCode = 403;
      return next(err);
    }
    next();
  } catch (error) {
    next(error);
  }
};

module.exports = {
  checkMyAccount,
  checkAdmin,
  checkUser,
};
