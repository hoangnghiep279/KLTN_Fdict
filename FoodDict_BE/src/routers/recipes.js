const express = require("express");
const router = express.Router();
const controller = require("../controllers/recipes");
const fs = require("fs");
const multer = require("multer");
const path = require("path");
const { checkLogin } = require("../middleware/checkLogin");
const { checkAdmin, checkUser } = require("../middleware/checkPermission");
const uploadDir = path.join(__dirname, "../resources/img-recipes");
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir, { recursive: true });
}

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, "../resources/img-recipes"));
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname); // Lấy phần mở rộng gốc
    const filename = `${Date.now()}${ext}`; // Tạo tên mới giữ nguyên đuôi
    cb(null, filename);
  },
});

const upload = multer({ storage });
// lấy tất cả công thức với trạng thái 1 - client
router.get("/", async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const search = req.query.search || "";
    const sortType = req.query.sortType || "all";

    const result = await controller.getRecipe(page, limit, search, sortType);
    res.json(result);
  } catch (error) {
    next(error);
  }
});
// ds công thức  đóng góp - client
router.get("/user-recipe", checkLogin, async (req, res, next) => {
  try {
    const userId = req.payload.id;
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const search = req.query.search || "";

    const result = await controller.getRecipeOfUser(
      userId,
      page,
      limit,
      search
    );
    res.json(result);
  } catch (error) {
    next(error);
  }
});

// lấy tất cả công thức khi đăng nhập -client
router.get("/recipefav", checkLogin, async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const userId = req.payload.id;
    const sortType = req.query.sortType || "all";

    const result = await controller.getRecipesWithFavoriteStatus(
      userId,
      page,
      limit,
      sortType
    );
    res.json(result);
  } catch (error) {
    next(error);
  }
});

// lọc công thức - client
router.post("/search", async (req, res, next) => {
  try {
    console.log(req.body);
    const result = await controller.searchRecipes(req.body);
    res.json(result);
  } catch (error) {
    next(error);
  }
});

// lấy công thức với id - client
router.get("/:id", async (req, res, next) => {
  try {
    res.json(await controller.getRecipeById(req.params.id));
  } catch (error) {
    next(error);
  }
});
// lấy công thức với id khi đăng nhập - client
router.get("/detail-foruser/:id", checkLogin, async (req, res, next) => {
  try {
    res.json(
      await controller.getRecipeByIdForUser(req.params.id, req.payload.id)
    );
  } catch (error) {
    next(error);
  }
});

// lấy thông tin công thức để update - admin
router.get("/get-update/:id", async (req, res, next) => {
  try {
    const recipeId = req.params.id;
    res.json(await controller.getRecipeUpdate(recipeId));
  } catch (error) {
    next(error);
  }
});

//thêm công thức bên admin
router.post(
  "/admin",
  checkLogin,
  checkAdmin,
  upload.fields([
    { name: "img_url", maxCount: 1 },
    { name: "img_nutrition", maxCount: 1 },
  ]),
  async (req, res, next) => {
    try {
      const img_url = req.files["img_url"]
        ? `resources/img-recipes/${req.files["img_url"][0].filename}`
        : null;
      const img_nutrition = req.files["img_nutrition"]
        ? `resources/img-recipes/${req.files["img_nutrition"][0].filename}`
        : null;

      const recipeData = {
        ...req.body,
        img_url,
        img_nutrition,
        status: 1,
        user_id: req.payload.id,
      };
      console.log(recipeData);

      res.json(await controller.insertRecipe(recipeData));
    } catch (error) {
      next(error);
    }
  }
);

// thêm công thức người dùng
router.post(
  "/user",
  checkLogin,
  checkUser,
  upload.fields([
    { name: "img_url", maxCount: 1 },
    { name: "img_nutrition", maxCount: 1 },
  ]),
  async (req, res, next) => {
    try {
      const img_url = req.files["img_url"]
        ? `resources/img-recipes/${req.files["img_url"][0].filename}`
        : null;
      const img_nutrition = req.files["img_nutrition"]
        ? `resources/img-recipes/${req.files["img_nutrition"][0].filename}`
        : null;

      const recipeData = {
        ...req.body,
        img_url,
        img_nutrition,
        status: 0,
        user_id: req.payload.id,
      };

      res.json(await controller.insertRecipe(recipeData));
    } catch (error) {
      next(error);
    }
  }
);

// sửa công thức - both
router.put(
  "/:id",
  upload.fields([
    { name: "img_url", maxCount: 1 },
    { name: "img_nutrition", maxCount: 1 },
  ]),
  async (req, res, next) => {
    try {
      const recipeId = req.params.id;

      // Kiểm tra ảnh mới, nếu có thì cập nhật đường dẫn
      const img_url = req.files["img_url"]
        ? `resources/img-recipes/${req.files["img_url"][0].filename}`
        : req.body.img_url;

      const img_nutrition = req.files["img_nutrition"]
        ? `resources/img-recipes/${req.files["img_nutrition"][0].filename}`
        : req.body.img_nutrition;

      const updatedRecipe = {
        ...req.body,
        img_url,
        img_nutrition,
      };

      const result = await controller.updateRecipe(recipeId, updatedRecipe);
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);
// lấy danh sách công thức chờ duyệt - admin
router.get(
  "/admin/pending-recipes",
  checkLogin,
  checkAdmin,
  async (req, res, next) => {
    try {
      const page = parseInt(req.query.page) || 1;
      const limit = parseInt(req.query.limit) || 10;
      const search = req.query.search || "";

      const result = await controller.getPendingRecipes(page, limit, search);
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
);

// duyệt hoặc từ chối - admin
router.patch(
  "/admin/update-status/:id",
  checkLogin,
  checkAdmin,
  async (req, res, next) => {
    try {
      const recipeId = req.params.id;
      const { status } = req.body;

      if (![1, 2].includes(status)) {
        return res.status(400).json({ message: "Trạng thái không hợp lệ." });
      }

      const result = await controller.updateRecipeStatus(recipeId, status);
      res.status(result.code).json(result);
    } catch (error) {
      next(error);
    }
  }
);

// xóa công thưucs
router.delete("/:id", async (req, res, next) => {
  try {
    const { id } = req.params;
    if (!id) {
      return res.status(400).json({ error: "Thiếu ID công thức" });
    }

    res.json(await controller.deleteRecipe(id));
  } catch (error) {
    next(error);
  }
});

module.exports = router;
