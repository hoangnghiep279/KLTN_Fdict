const express = require("express");
const cors = require("cors");
const userRoutes = require("./routers/user");
const recipe = require("./routers/recipes");
const app = express();
const path = require("path");
app.use(cors());
app.use(express.json());
app.use(
  "/resources/user-img",
  express.static(path.join(__dirname, "resources/user-img"))
);

app.use("/api/users", userRoutes);
app.use("/recipe", recipe);

module.exports = app;
