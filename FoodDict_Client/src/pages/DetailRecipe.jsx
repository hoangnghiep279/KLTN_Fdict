import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import getRecipeById from "../api/recipes/getRecipeById.js";
function DetailRecipe() {
  const { id } = useParams();
  const [recipes, setRecipes] = useState([]);
  const [ingredients, setIngredients] = useState([]);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    getRecipeById(setRecipes, setIngredients, setLoading, id);
  }, [id]);
  console.log(recipes);
  console.log(ingredients);
  return (
    <div className="container">
      <h1>{recipes.name} </h1>
    </div>
  );
}

export default DetailRecipe;
