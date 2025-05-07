const express = require("express");
const router = express.Router();
const controller = require("../controllers/nutrition");

// xem
router.get("/", async (req, res, next) => {
  try {
    res.json(await controller.getNutrition());
  } catch (error) {
    next(error);
  }
});

router.get("/by-nutrition", async (req, res, next) => {
  try {
    const result = await controller.getAllNutritionWithRecipes();
    res.status(200).json(result);
  } catch (error) {
    next(error);
  }
});

// lọc công thức
router.get("/recipes", async (req, res, next) => {
  try {
    const { nutrition_id } = req.query;

    if (!nutrition_id) {
      return res.status(400).json({ code: 400, message: "Thiếu nutrition_id" });
    }

    res.json(await controller.getRecipesByNutritionNeed(nutrition_id));
  } catch (error) {
    next(error);
  }
});

// thêm
router.post("/", async (req, res, next) => {
  try {
    res.json(await controller.insertNutrition(req.body));
  } catch (error) {
    next(error);
  }
});

// sửa
router.put("/:id", async (req, res, next) => {
  try {
    res.json(await controller.updateNutrition(req.params.id, req.body));
  } catch (error) {
    next(error);
  }
});

// xóa
router.delete("/:id", async (req, res, next) => {
  try {
    res.json(await controller.deleteNutrition(req.params.id));
  } catch (error) {
    next(error);
  }
});

module.exports = router;
