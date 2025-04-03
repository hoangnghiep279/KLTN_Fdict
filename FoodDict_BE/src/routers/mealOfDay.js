const express = require("express");
const router = express.Router();
const controller = require("../controllers/mealOfDay");

router.get("/", async (req, res, next) => {
  try {
    res.json(await controller.getMealOfDay());
  } catch (error) {
    next(error);
  }
});

module.exports = router;
