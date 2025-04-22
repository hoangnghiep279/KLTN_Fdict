import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/api/users";
const fetchListUser = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data.rows;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách dinh dưỡng:", error);
    toast.error("Không thể tải danh sách dinh dưỡng!");
    throw error;
  }
};
const banUser = async (userId, days) => {
  try {
    const response = await axios.put(`${API_URL}/ban/${userId}`, { days });
    toast.success(response.data.message);
    return response.data;
  } catch (error) {
    console.error("Lỗi khi ban người dùng:", error);
    toast.error("Không thể ban người dùng!");
    throw error;
  }
};

// Bỏ ban người dùng
const unbanUser = async (userId) => {
  try {
    const response = await axios.put(`${API_URL}/unban/${userId}`);
    toast.success(response.data.message);
    return response.data;
  } catch (error) {
    console.error("Lỗi khi bỏ ban người dùng:", error);
    toast.error("Không thể bỏ ban người dùng!");
    throw error;
  }
};

export { fetchListUser, banUser, unbanUser };
