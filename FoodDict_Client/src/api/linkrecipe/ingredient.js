import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/ingredient";

// 1. Lấy danh sách nguyên liệu
const fetchIngredient = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách nguyên liệu:", error);
    toast.error("Không thể tải danh sách nguyên liệu!");
    throw error;
  }
};

export { fetchIngredient };
