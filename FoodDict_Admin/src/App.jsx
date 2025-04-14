import { Route, Routes, Navigate } from "react-router-dom";
import { useEffect, useState } from "react";
import LayoutWeb from "./components/layout/LayoutWeb";
import Home from "./pages/Home";
import InsertRecipe from "./pages/InsertRecipe";
import UpdateRecipe from "./pages/UpdateRecipe";
import RecipeDetail from "./pages/RecipeDetail";
import Nutrition from "./pages/Nutrition";
import CookMethod from "./pages/CookMethod";
import MealType from "./pages/Mealtype";

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<LayoutWeb />}>
        <Route index element={<Home />} />
        <Route path="updaterecipe/:id" element={<UpdateRecipe />} />
        <Route path="recipedetail/:id" element={<RecipeDetail />} />

        <Route path="insertRecipe" element={<InsertRecipe />} />
        <Route path="nutritionNeeds" element={<Nutrition />} />
        <Route path="cookingMethods" element={<CookMethod />} />
        <Route path="mealTypes" element={<MealType />} />
      </Route>
    </Routes>
  );
};

export default App;
