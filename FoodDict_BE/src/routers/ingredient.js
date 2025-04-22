const express = require("express");
const router = express.Router();
const controller = require("../controllers/ingredient");

router.get("/", async (req, res, next) => {
  try {
    res.json(await controller.getIngredientsByType());
  } catch (error) {
    next(error);
  }
});

module.exports = router;
