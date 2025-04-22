import axios from "axios";

const API_URL = "http://localhost:3000/recipe/search";

const searchRecipes = async (filters) => {
  const response = await axios.post(API_URL, filters);
  return response.data;
};

export default searchRecipes;
