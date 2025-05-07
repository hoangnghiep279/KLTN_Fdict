import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/mealtype";

// 1. Lấy danh sách cách nấu
const fetchMealType = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách loại món ăn:", error);
    toast.error("Không thể tải danh sách loại món ăn!");
    throw error;
  }
};

async function getRecipesByMealTypes() {
  try {
    const res = await axios.get("http://localhost:3000/mealtype/by-mealtypes");
    return res.data;
  } catch (error) {
    console.error("Lỗi khi gọi API getRecipesByMealTypes:", error);
    return { code: 500, data: [] };
  }
}

export { fetchMealType, getRecipesByMealTypes };
