const express = require("express");
const router = express.Router();
const controller = require("../controllers/cookMethod");

router.get("/", async (req, res, next) => {
  try {
    res.json(await controller.getCookMethod());
  } catch (error) {
    next(error);
  }
});
router.get("/by-cookmethod", async (req, res, next) => {
  try {
    const result = await controller.getAllCookMethodWithRecipes();
    res.status(200).json(result);
  } catch (error) {
    next(error);
  }
});
// thêm
router.post("/", async (req, res, next) => {
  try {
    res.json(await controller.insertCookMethod(req.body));
  } catch (error) {
    next(error);
  }
});

// sửa
router.put("/:id", async (req, res, next) => {
  try {
    res.json(await controller.updateCookMethod(req.params.id, req.body));
  } catch (error) {
    next(error);
  }
});

// xóa
router.delete("/:id", async (req, res, next) => {
  try {
    res.json(await controller.deleteCookMethod(req.params.id));
  } catch (error) {
    next(error);
  }
});

module.exports = router;
