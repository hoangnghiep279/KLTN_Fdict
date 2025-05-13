const express = require("express");
const router = express.Router();
const controller = require("../controllers/usermealPlan");
const { checkLogin } = require("../middleware/checkLogin");
// hiện
router.get("/", checkLogin, async (req, res, next) => {
  try {
    const response = await controller.getUserMealPlans(req.payload.id);
    res.status(response.code).json(response);
  } catch (error) {
    next(error);
  }
});
// thêm
router.post("/", checkLogin, async (req, res, next) => {
  try {
    const response = await controller.addMealPlan(req.payload.id, req.body);
    res.status(response.code).json(response);
  } catch (error) {
    next(error);
  }
});
// xóa
router.delete("/:id", checkLogin, async (req, res, next) => {
  try {
    const response = await controller.deleteMealPlan(
      req.payload.id,
      req.params.id
    );
    res.status(response.code).json(response);
  } catch (error) {
    next(error);
  }
});
// món gợi ý
router.get("/suggested", async (req, res, next) => {
  try {
    const response = await controller.getSuggestedRecipes();
    res.status(response.code).json(response);
  } catch (err) {
    next(err);
  }
});
// tìm kiếm
router.get("/search", async (req, res, next) => {
  try {
    const { keyword } = req.query;
    const response = await controller.searchRecipes(keyword);
    res.status(response.code).json(response);
  } catch (err) {
    next(err);
  }
});
module.exports = router;
