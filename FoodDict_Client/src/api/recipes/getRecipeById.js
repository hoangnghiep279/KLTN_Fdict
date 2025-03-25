import axios from "axios";

const getRecipeById = async (setRecipes, setIngredients, setLoading, id) => {
  try {
    const response = await axios.get(`http://localhost:3000/recipe/${id}`);
    setRecipes(response.data.recipe);
    setIngredients(response.data.ingredients);
  } catch (error) {
    console.error("Lỗi khi lấy món ăn:", error);
  } finally {
    setLoading(false);
  }
};

export default getRecipeById;
