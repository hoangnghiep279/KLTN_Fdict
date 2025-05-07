const express = require("express");
const router = express.Router();
const controller = require("../controllers/favoriteRecipe")
const { checkLogin } = require("../middleware/checkLogin");
router.get("/", checkLogin, async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1; 
    const limit = parseInt(req.query.limit) || 10; 

    const result = await controller.getFavoriteRecipes(req.payload.id , page, limit);
    res.json(result);
  } catch (error) {
    next(error); 
  }
});

router.post("/",checkLogin, async (req, res, next) => {
    try {
      console.log(req.body)
      console.log("thêm")
      const result = await controller.addFavoriteRecipe(req.payload.id, req.body);
      res.status(result.code).json({ message: result.message });
    } catch (error) {
      next(error);
    }
});
router.delete("/",checkLogin, async (req, res, next) => {
    try {
  console.log(req.body)
      const result = await controller.deleteFavoriteRecipe(req.payload.id, req.body);
      res.status(result.code).json({ message: result.message });
    } catch (error) {
      next(error); 
    }
  });


module.exports = router;
