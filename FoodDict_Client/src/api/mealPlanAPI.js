// src/api/mealPlanApi.js
import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/meal-plan";

// Hàm gọi API lấy meal plans
const fetchMealPlans = async (token) => {
  try {
    const response = await axios.get(API_URL, {
      headers: { Authorization: `Bearer ${token}` },
    });
    return response.data.data;
  } catch (error) {
    console.error("Lỗi khi lấy meal plan:", error);
    toast.error("Không thể tải kế hoạch nấu ăn!");
    throw error;
  }
};

const fetchSuggestedRecipes = async () => {
  try {
    const response = await axios.get(`${API_URL}/suggested`);
    return response.data.data;
  } catch (error) {
    console.error("Lỗi khi lấy món gợi ý:", error);
    toast.error("Không thể tải danh sách món gợi ý!");
    throw error;
  }
};

// Tìm kiếm món ăn
const searchRecipes = async (keyword) => {
  try {
    const response = await axios.get(`${API_URL}/search?keyword=${keyword}`);
    return response.data.data;
  } catch (error) {
    console.error("Lỗi khi tìm kiếm công thức:", error);
    toast.error("Không thể tìm kiếm công thức!");
    throw error;
  }
};

const deleteMealPlan = async (mealPlanId, token) => {
  try {
    const response = await axios.delete(`${API_URL}/${mealPlanId}`, {
      headers: { Authorization: `Bearer ${token}` },
    });
    toast.success("Đã xóa món ăn!");
    return response.data;
  } catch (error) {
    toast.error("Xóa món ăn thất bại!");
    console.error(error);
    throw error;
  }
};
const addMealPlan = async (token, mealPlans) => {
  try {
    const response = await axios.post(`${API_URL}`, mealPlans, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    toast.success("Thêm món ăn thành công!");
    return response.data;
  } catch (error) {
    toast.error("Thêm món ăn thất bại!");
    console.error("Lỗi thêm thực đơn:", error);
    throw error;
  }
};

export {
  fetchMealPlans,
  fetchSuggestedRecipes,
  searchRecipes,
  deleteMealPlan,
  addMealPlan,
};
