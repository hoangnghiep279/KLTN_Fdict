import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/recipe/admin/pending-recipes";

const getPendingRecipes = async (page = 1, limit = 10, search = "") => {
  try {
    const token = localStorage.getItem("token");
    const response = await axios.get(API_URL, {
      params: { page, limit, search },
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    return response.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách công thức chờ duyệt:", error);
    toast.error("Không thể lấy danh sách công thức chờ duyệt.");
    throw error;
  }
};

export default getPendingRecipes;
