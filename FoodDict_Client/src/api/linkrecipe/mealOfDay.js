import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/mealofday";

// 1. Lấy danh sách dinh dưỡng
const fetchMealOfDay = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data.data;
  } catch (error) {
    console.error("Lỗi khi lấy loại bữa ăn:", error);
    toast.error("Không thể tải loại bữa ăn!");
    throw error;
  }
};
async function getRecipesByMealCate() {
  try {
    const res = await axios.get("http://localhost:3000/mealofday/by-mealcate");
    return res.data;
  } catch (error) {
    console.error("Lỗi khi gọi API getRecipesByMealCate:", error);
    return { code: 500, data: [] };
  }
}

export { fetchMealOfDay, getRecipesByMealCate };
