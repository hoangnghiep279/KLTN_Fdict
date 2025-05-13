import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/comment";

// Lấy tất cả comment theo công thức (recipe)
export const fetchCommentsByRecipe = async (recipeId) => {
  try {
    const res = await axios.get(`${API_URL}/${recipeId}`);
    return res.data.data;
  } catch (err) {
    console.error("Lỗi khi lấy bình luận:", err);
    toast.error("Không thể tải bình luận!");
    return [];
  }
};

// Thêm bình luận
export const addComment = async (comment, token) => {
  if (!comment?.recipe_id || !comment?.content?.trim()) {
    toast.error("Vui lòng nhập nội dung bình luận");
    return;
  }

  try {
    const res = await axios.post(`${API_URL}`, comment, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    toast.success("Thêm bình luận thành công!");
    return res.data;
  } catch (err) {
    console.error("Lỗi khi thêm bình luận:", err);
    toast.error(err?.response?.data?.message || "Thêm bình luận thất bại!");
    throw err;
  }
};

// Xóa bình luận
export const deleteComment = async (commentId, token) => {
  if (!commentId) {
    toast.error("ID bình luận không hợp lệ!");
    return;
  }

  try {
    const res = await axios.delete(`${API_URL}/${commentId}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    toast.success("Xóa bình luận thành công!");
    return res.data;
  } catch (err) {
    console.error("Lỗi khi xóa bình luận:", err);
    toast.error(err?.response?.data?.message || "Không thể xóa bình luận!");
    throw err;
  }
};

// Cập nhật bình luận
export const updateComment = async (commentId, content, token) => {
  if (!commentId || !content?.trim()) {
    toast.error("Nội dung hoặc ID bình luận không hợp lệ!");
    return;
  }

  try {
    const res = await axios.put(
      `${API_URL}/${commentId}`,
      { content },
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );
    toast.success("Cập nhật bình luận thành công!");
    return res.data;
  } catch (err) {
    console.error("Lỗi khi cập nhật bình luận:", err);
    toast.error(
      err?.response?.data?.message || "Không thể cập nhật bình luận!"
    );
    throw err;
  }
};
