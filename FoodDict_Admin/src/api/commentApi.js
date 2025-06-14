import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/comment";

// Lấy tất cả comment theo công thức (recipe)

export const deleteComment = async (commentId) => {
  try {
    const res = await axios.delete(`${API_URL}/admin/${commentId}`);

    return res.data;
  } catch (err) {
    console.error("Lỗi khi xóa bình luận:", err);
    toast.error("Không thể xóa bình luận!");
    return null;
  }
};

export const searchComment = async (page = 1, limit = 5, search = "") => {
  try {
    // Gọi đúng endpoint /admin/search theo router bạn có
    const res = await axios.get(
      `${API_URL}/admin/search?page=${page}&limit=${limit}&search=${encodeURIComponent(
        search
      )}`
    );
    const { comments, total, currentPage, totalPages } = res.data.data;

    return {
      data: comments,
      pagination: {
        page: currentPage,
        limit,
        total,
        totalPages,
      },
    };
  } catch (err) {
    console.error("Lỗi khi lấy bình luận:", err);
    toast.error("Không thể tải bình luận!");
    return {
      data: [],
      pagination: { page: 1, limit, total: 0, totalPages: 1 },
    };
  }
};
