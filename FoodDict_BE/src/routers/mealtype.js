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

module.exports = router;
