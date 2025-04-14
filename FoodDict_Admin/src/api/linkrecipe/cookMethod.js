import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/cookmethod";

// 1. Lấy danh sách dinh dưỡng
const fetchCookMethod = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data.data;
  } catch (error) {
    console.error("Lỗi khi lấy danh sách dinh dưỡng:", error);
    toast.error("Không thể tải danh sách dinh dưỡng!");
    throw error;
  }
};

// 3. Thêm dinh dưỡng
const insertCookMethod = async (cookMethod) => {
  try {
    const response = await axios.post(API_URL, cookMethod);

    toast.success("Thêm dinh dưỡng thành công!");
    return response.data;
  } catch (error) {
    console.error("Lỗi khi thêm dinh dưỡng:", error);
    toast.error(
      error?.response?.data?.message || "Có lỗi xảy ra khi thêm dinh dưỡng!"
    );
    throw error;
  }
};

// 4. Cập nhật dinh dưỡng
const updateCookMethod = async (id, cookMethod) => {
  try {
    const response = await axios.put(`${API_URL}/${id}`, cookMethod);

    toast.success("Cập nhật dinh dưỡng thành công!");
    return response.data;
  } catch (error) {
    console.error("Lỗi khi cập nhật dinh dưỡng:", error);
    toast.error("Có lỗi xảy ra khi cập nhật dinh dưỡng!");
    throw error;
  }
};

// 5. Xóa dinh dưỡng
const deleteCookMethod = async (id) => {
  try {
    const response = await axios.delete(`${API_URL}/${id}`);

    toast.success("Xóa dinh dưỡng thành công!");
    return response.data;
  } catch (error) {
    console.error("Lỗi khi xóa dinh dưỡng:", error);
    toast.error("Không thể xóa dinh dưỡng!");
    throw error;
  }
};

export {
  fetchCookMethod,
  insertCookMethod,
  updateCookMethod,
  deleteCookMethod,
};
