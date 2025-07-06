import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/recipe";

const fetchRecipes = async (
  setRecipes,
  setTotalPages,
  setLoading,
  page,
  limit,
  search = ""
) => {
  try {
    setLoading(true);

    const token = localStorage.getItem("token"); // Lấy token từ localStorage (hoặc nơi bạn lưu)

    const response = await axios.get(`${API_URL}/user-recipe`, {
      params: {
        page,
        limit,
        search,
      },
      headers: {
        Authorization: `Bearer ${token}`, // Gửi token qua header
      },
    });

    setRecipes(response.data.data);
    setTotalPages(response.data.pagination.totalPages);
  } catch (error) {
    console.error("Lỗi khi lấy danh sách công thức:", error);
  } finally {
    setLoading(false);
  }
};
// API thêm công thức món ăn
const insertRecipe = async (formData) => {
  try {
    const token = localStorage.getItem("token");
    const response = await axios.post(`${API_URL}/user`, formData, {
      headers: {
        "Content-Type": "multipart/form-data",
        Authorization: `Bearer ${token}`,
      },
    });

    toast.success("Thêm công thức thành công!");
    return response.data;
  } catch (error) {
    console.error("Lỗi khi thêm công thức:", error);
    toast.error("Có lỗi xảy ra khi thêm công thức!");
    throw error;
  }
};
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
export { insertRecipe, fetchRecipes, fetchUpdateRecipe };
