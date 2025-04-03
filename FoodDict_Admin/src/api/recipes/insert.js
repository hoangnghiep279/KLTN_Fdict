import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/recipe";

// API thêm công thức món ăn
const insertRecipe = async (formData) => {
  try {
    const response = await axios.post(API_URL, formData, {
      headers: {
        "Content-Type": "multipart/form-data",
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

export default insertRecipe;
