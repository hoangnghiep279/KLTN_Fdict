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
