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

module.exports = router;
