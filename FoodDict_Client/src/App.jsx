import { Route, Routes, Navigate } from "react-router-dom";
import { useEffect, useState } from "react";
import LayoutWeb from "./components/layout/LayoutWeb";
import Home from "./pages/Home";
import DetailRecipe from "./pages/DetailRecipe";
import Profile from "./pages/Profile";
import RecipeFavorite from "./pages/RecipeFavorite";
import CookMethod from "./pages/CookMethod";
import MealOfDay from "./pages/MealOfDay";
import MealType from "./pages/MealType";
import Nutrition from "./pages/Nutrition";
import MealPlanner from "./pages/MealPlanner";
import InsertRecipe from "./pages/InsertRecipe";
import RecipeManager from "./pages/RecipeManager";
import UpdateRecipe from "./pages/UpdateRecipe";

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<LayoutWeb />}>
        <Route index element={<Home />} />
        <Route path="/detailRecipe/:id" element={<DetailRecipe />} />
        <Route path="/profile" element={<Profile />} />
        <Route path="/favorite" element={<RecipeFavorite />} />
        <Route path="/cookmethod" element={<CookMethod />} />
        <Route path="/mealofday" element={<MealOfDay />} />
        <Route path="/mealtype" element={<MealType />} />
        <Route path="/nutrition" element={<Nutrition />} />
        <Route path="/user-recipe-plan" element={<MealPlanner />} />
        <Route path="/recipe-manager" element={<RecipeManager />} />
        <Route path="/add-recipe" element={<InsertRecipe />} />
        <Route
          path="/recipe-manager/updaterecipe/:id"
          element={<UpdateRecipe />}
        />
      </Route>
    </Routes>
  );
};

export default App;
