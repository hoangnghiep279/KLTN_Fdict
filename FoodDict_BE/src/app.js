const express = require("express");
const cors = require("cors");
const userRoutes = require("./routers/user");
const recipe = require("./routers/recipes");
const mealtype = require("./routers/mealtype");
const cookMethod = require("./routers/cookMethod");
const mealOfDay = require("./routers/mealOfDay");
const nutrition = require("./routers/nutrition");
const ingredient = require("./routers/ingredient");
const comment = require("./routers/comment");
const favoriteRecipe = require("./routers/favoriteRecipe");
const usermealPlan = require("./routers/usermealPlan");
const app = express();
const path = require("path");
app.use(cors());
app.use(express.json());
app.use("/resources", express.static(path.join(__dirname, "resources")));
app.use(
  "/resources/user-img",
  express.static(path.join(__dirname, "resources/user-img"))
);
app.use(
  "/resources/img-recipes",
  express.static(path.join(__dirname, "resources/img-recipes"))
);

app.use("/api/users", userRoutes);
app.use("/recipe", recipe);
app.use("/mealtype", mealtype);
app.use("/nutrition", nutrition);
app.use("/mealofday", mealOfDay);
app.use("/cookmethod", cookMethod);
app.use("/ingredient", ingredient);
app.use("/comment", comment);
app.use("/favorite-recipe", favoriteRecipe);
app.use("/meal-plan", usermealPlan);

module.exports = app;
