const express = require("express");
const router = express.Router();
const fs = require("fs");
const controller = require("../controllers/user");
const { checkLogin } = require("../middleware/checkLogin");
const multer = require("multer");
const path = require("path");

const uploadDir = path.join(__dirname, "../resources/user-img");
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, "../resources/user-img"));
  },
});

const upload = multer({ storage });

router.get("/", async (req, res, next) => {
  try {
    res.json(await controller.getListUser());
  } catch (error) {
    next(error);
  }
});
// tạo tài khoản
router.post("/register", async (req, res, next) => {
  try {
    res.json(await controller.register(req.body));
  } catch (error) {
    next(error);
  }
});
// đăng nhập tài khoản người dùng
router.post("/user-login", async (req, res, next) => {
  try {
    const result = await controller.userLogin(req.body);
    res.status(result.code).json(result);
  } catch (error) {
    next(error);
  }
});

// đăng nhập tài khoản admin
router.post("/admin-login", async (req, res, next) => {
  try {
    const result = await controller.adminLogin(req.body);
    res.status(result.code).json(result);
  } catch (error) {
    next(error);
  }
});

router.put("/ban/:id", async (req, res, next) => {
  try {
    const result = await controller.banUser(req.params.id, req.body);
    res.status(result.code).json(result);
  } catch (error) {
    next(error);
  }
});
router.put("/unban/:id", async (req, res, next) => {
  try {
    const result = await controller.unbanUser(req.params.id);
    res.status(result.code).json(result);
  } catch (error) {
    next(error);
  }
});

// xem thông tin người dùng
router.get("/profile", checkLogin, async (req, res, next) => {
  try {
    const userId = req.payload.id;
    const user = await controller.getUserById(userId);
    res.status(200).json({ data: user });
  } catch (error) {
    next(error);
  }
});

// chỉnh sửa thông tin người dùng
router.put(
  "/profile",
  checkLogin,
  upload.single("avatar"),
  async (req, res, next) => {
    try {
      const user = req.body;
      const result = await controller.updateUser(
        req.payload.id,
        user,
        req.file
      );
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);
router.put("/change_password", checkLogin, async (req, res, next) => {
  try {
    res.json(await controller.changePassword(req.payload.id, req.body));
  } catch (error) {
    next(error);
  }
});
module.exports = router;
