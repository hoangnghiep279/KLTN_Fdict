const express = require("express");
const router = express.Router();
const controller = require("../controllers/recipes");

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
router.get("/:id", async (req, res, next) => {
  try {
    res.json(await controller.getRecipeById(req.params.id));
  } catch (error) {
    next(error);
  }
});

module.exports = router;
