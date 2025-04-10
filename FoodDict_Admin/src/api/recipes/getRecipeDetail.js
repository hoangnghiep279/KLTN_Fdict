import axios from "axios";

const fetchUpdateRecipe = async (
  id,
  setRecipe,
  setPreviewImage,
  setImgNutrition,
  setLoading
) => {
  try {
    const res = await axios.get(
      `http://localhost:3000/recipe/get-update/${id}`
    );
    setRecipe({
      ...res.data,
      selectedMealTypes: res.data.mealTypes
        .filter((m) => m.checked)
        .map((m) => m.id),
      selectedMealCategories: res.data.mealCategories
        .filter((c) => c.checked)
        .map((c) => c.id),
      selectedCookingMethods: res.data.cookingMethods
        .filter((c) => c.checked)
        .map((c) => c.id),
      selectedNutritionNeeds: res.data.nutritionNeeds
        .filter((n) => n.checked)
        .map((n) => n.id),
    });
    setPreviewImage(`http://localhost:3000/${res.data.img_url}`);
    setImgNutrition(`http://localhost:3000/${res.data.img_nutrition}`);
  } catch (err) {
    console.error(err);
  } finally {
    setLoading(false);
  }
};

export default fetchUpdateRecipe;
