const express = require("express");
const router = express.Router();
const controller = require("../controllers/getuser");

router.get("/", async (req, res, next) => {
  try {
    const result = await controller.getUserList();
    res.status(200).json(result);
  } catch (error) {
    throw error;
  }
});

module.exports = router;
