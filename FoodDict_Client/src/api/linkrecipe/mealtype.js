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

export { fetchMealType };
