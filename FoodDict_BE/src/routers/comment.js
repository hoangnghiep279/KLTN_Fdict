const express = require("express");
const router = express.Router();
const controller = require("../controllers/comment");
const { checkLogin } = require("../middleware/checkLogin");
// GET: Lấy bình luận theo recipe_id
router.get("/:recipeId", async (req, res, next) => {
  try {
    const response = await controller.getCommentsByRecipe(req.params.recipeId);
    res.status(response.code).json(response);
  } catch (error) {
    next(error);
  }
});

// thêm bình luận
router.post("/", checkLogin, async (req, res, next) => {
  try {
    const response = await controller.addComment(req.payload.id, req.body);
    res.status(response.code).json(response);
  } catch (error) {
    next(error);
  }
});
// xóa
router.delete("/:id", checkLogin, async (req, res, next) => {
  try {
    const response = await controller.deleteComment(
      req.payload.id,
      req.params.id
    );
    res.status(response.code).json(response);
  } catch (error) {
    next(error);
  }
});

//  Sửa bình luận
router.put("/:id", checkLogin, async (req, res, next) => {
  try {
    const { content } = req.body;
    const response = await controller.updateComment(
      req.payload.id,
      req.params.id,
      content
    );
    res.status(response.code).json(response);
  } catch (error) {
    next(error);
  }
});
module.exports = router;
