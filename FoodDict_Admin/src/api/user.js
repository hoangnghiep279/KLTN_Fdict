import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/api/users";
const fetchListUser = async (page = 1, limit = 10, search = "") => {
  try {
    const response = await axios.get(API_URL, {
      params: { page, limit, search },
    });
    return response.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách người dùng:", error);
    toast.error("Không thể tải danh sách người dùng!");
    throw error;
  }
};
const banUser = async (userId, data) => {
  try {
    const response = await axios.put(`${API_URL}/ban/${userId}`, data);
    return response.data;
  } catch (error) {
    console.error("Lỗi khi ban người dùng:", error);
    toast.error("Không thể ban người dùng!");
    throw error;
  }
};

// Bỏ ban người dùng
const unbanUser = async (userId, data) => {
  try {
    const response = await axios.put(`${API_URL}/unban/${userId}`, data);
    return response.data;
  } catch (error) {
    toast.error("Không thể bỏ ban người dùng!");
    throw error;
  }
};

export { fetchListUser, banUser, unbanUser };
