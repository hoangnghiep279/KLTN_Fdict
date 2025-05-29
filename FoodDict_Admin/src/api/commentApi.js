import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/comment";

// Lấy tất cả comment theo công thức (recipe)
export const fetchComment = async (page = 1, limit = 5) => {
  try {
    const res = await axios.get(`${API_URL}/admin?page=${page}&limit=${limit}`);
    return res.data;
  } catch (err) {
    console.error("Lỗi khi lấy bình luận:", err);
    toast.error("Không thể tải bình luận!");
    return {
      data: [],
      pagination: { page: 1, limit: 5, total: 0, totalPages: 1 },
    };
  }
};

export const deleteComment = async (commentId) => {
  try {
    const res = await axios.delete(`${API_URL}/admin/${commentId}`);
    toast.success("Xóa bình luận thành công!");
    return res.data;
  } catch (err) {
    console.error("Lỗi khi xóa bình luận:", err);
    toast.error("Không thể xóa bình luận!");
    return null;
  }
};

// Xóa bình luận
