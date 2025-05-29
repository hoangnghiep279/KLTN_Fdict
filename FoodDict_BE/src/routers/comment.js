const express = require("express");
const router = express.Router();
const controller = require("../controllers/comment");
const { checkLogin } = require("../middleware/checkLogin");

// lấy danh sách admin
router.get("/admin", async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;

    const response = await controller.getAllCommentsForAdmin(page, limit);
    res.status(response.code).json(response);
  } catch (error) {
    next(error);
  }
});

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
// routes/comment.route.js
router.delete("/admin/:id", async (req, res, next) => {
  try {
    const commentId = req.params.id;
    const response = await controller.deleteCommentById(commentId);
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
