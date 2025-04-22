const express = require("express");
const router = express.Router();
const controller = require("../controllers/recipes");
const fs = require("fs");
const multer = require("multer");
const path = require("path");
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
// lấy tất cả công thức có trong db
router.get("/", async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;

    const result = await controller.getRecipe(page, limit);
    res.json(result);
  } catch (error) {
    next(error);
  }
});

// lọc công thức
router.post("/search", async (req, res, next) => {
  try {
    const result = await controller.searchRecipes(req.body);
    res.json(result);
  } catch (error) {
    next(error);
  }
});

// lấy công thức với id
router.get("/:id", async (req, res, next) => {
  try {
    res.json(await controller.getRecipeById(req.params.id));
  } catch (error) {
    next(error);
  }
});

// lấy thông tin công thức để update
router.get("/get-update/:id", async (req, res, next) => {
  try {
    const recipeId = req.params.id;
    res.json(await controller.getRecipeUpdate(recipeId));
  } catch (error) {
    next(error);
  }
});

// thêm công thức
router.post(
  "/",
  upload.fields([
    { name: "img_url", maxCount: 1 },
    { name: "img_nutrition", maxCount: 1 },
  ]),
  async (req, res, next) => {
    try {
      if (!req.body || Object.keys(req.body).length === 0) {
        return res.status(400).json({ error: "Dữ liệu không hợp lệ" });
      }

      const img_url = req.files["img_url"]
        ? `resources/img-recipes/${req.files["img_url"][0].filename}`
        : null;
      const img_nutrition = req.files["img_nutrition"]
        ? `resources/img-recipes/${req.files["img_nutrition"][0].filename}`
        : null;

      res.json(
        await controller.insertRecipe({ ...req.body, img_url, img_nutrition })
      );
    } catch (error) {
      next(error);
    }
  }
);

// sửa công thức
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
