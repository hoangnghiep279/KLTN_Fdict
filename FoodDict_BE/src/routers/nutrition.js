const express = require("express");
const router = express.Router();
const controller = require("../controllers/nutrition");

router.get("/", async (req, res, next) => {
  try {
    res.json(await controller.getNutrition());
  } catch (error) {
    next(error);
  }
});

module.exports = router;
