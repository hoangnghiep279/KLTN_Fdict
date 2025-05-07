import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/cookmethod";

// 1. Lấy danh sách dinh dưỡng
const fetchCookMethod = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách cách nấu:", error);
    toast.error("Không thể tải danh sách cách nấu!");
    throw error;
  }
};
async function getRecipesByCookmethod() {
  try {
    const res = await axios.get(
      "http://localhost:3000/cookmethod/by-cookmethod"
    );
    return res.data;
  } catch (error) {
    console.error("Lỗi khi gọi API getRecipesByCookmethod:", error);
    return { code: 500, data: [] };
  }
}

export { fetchCookMethod, getRecipesByCookmethod };
