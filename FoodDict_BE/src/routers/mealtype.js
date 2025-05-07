const express = require("express");
const router = express.Router();
const controller = require("../controllers/mealtype");

router.get("/", async (req, res, next) => {
  try {
    res.json(await controller.getMealType());
  } catch (error) {
    next(error);
  }
});
// lấy loại món ăn trang client
router.get("/by-mealtypes", async (req, res, next) => {
  try {
    const result = await controller.getAllMealTypesWithRecipes();
    res.status(200).json(result);
  } catch (error) {
    next(error);
  }
});


// thêm
router.post("/", async (req, res, next) => {
  try {
    res.json(await controller.insertMealType(req.body));
  } catch (error) {
    next(error);
  }
});

// sửa
router.put("/:id", async (req, res, next) => {
  try {
    res.json(await controller.updateMealType(req.params.id, req.body));
  } catch (error) {
    next(error);
  }
});

// xóa
router.delete("/:id", async (req, res, next) => {
  try {
    res.json(await controller.deleteMealType(req.params.id));
  } catch (error) {
    next(error);
  }
});

module.exports = router;
