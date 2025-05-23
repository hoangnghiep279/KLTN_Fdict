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
import ListUser from "./pages/ListUser";
import Login from "./pages/Login";

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<Login />} />
      <Route path="/admin" element={<LayoutWeb />}>
        <Route index element={<Home />} />
        <Route path="/admin/updaterecipe/:id" element={<UpdateRecipe />} />
        <Route path="/admin/recipedetail/:id" element={<RecipeDetail />} />

        <Route path="/admin/insertRecipe" element={<InsertRecipe />} />
        <Route path="/admin/nutritionNeeds" element={<Nutrition />} />
        <Route path="/admin/cookingMethods" element={<CookMethod />} />
        <Route path="/admin/user-management" element={<ListUser />} />
        <Route path="/admin/mealTypes" element={<MealType />} />
      </Route>
    </Routes>
  );
};

export default App;
