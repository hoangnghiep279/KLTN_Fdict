import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/nutrition";

// 1. Lấy danh sách dinh dưỡng
const fetchNutrition = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách dinh dưỡng:", error);
    toast.error("Không thể tải danh sách dinh dưỡng!");
    throw error;
  }
};

async function getRecipesByNutrition() {
  try {
    const res = await axios.get("http://localhost:3000/nutrition/by-nutrition");
    return res.data;
  } catch (error) {
    console.error("Lỗi khi gọi API getRecipesByNutrition:", error);
    return { code: 500, data: [] };
  }
}

export { fetchNutrition, getRecipesByNutrition };
