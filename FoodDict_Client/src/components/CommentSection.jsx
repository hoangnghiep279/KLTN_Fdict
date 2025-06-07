import React, { useEffect, useState } from "react";
import {
  fetchCommentsByRecipe,
  addComment,
  deleteComment,
  updateComment,
} from "../api/commentApi";
import { toast } from "react-toastify";
import { jwtDecode } from "jwt-decode";

const CommentSection = ({ recipeId, userToken }) => {
  const [currentUserId, setCurrentUserId] = useState(null);
  const [comments, setComments] = useState([]);
  const [newComment, setNewComment] = useState("");
  const [editingComment, setEditingComment] = useState(null);
  const [updatedContent, setUpdatedContent] = useState("");

  useEffect(() => {
    if (recipeId) {
      loadComments();
    }
  }, [recipeId]);
  useEffect(() => {
    if (userToken) {
      const decoded = jwtDecode(userToken);
      setCurrentUserId(decoded.id);
    }
  }, [userToken]);
  const loadComments = async () => {
    try {
      const data = await fetchCommentsByRecipe(recipeId);
      setComments(data);
    } catch (error) {
      console.error("Lỗi khi tải bình luận:", error);
    }
  };

  // const handleAddComment = async () => {
  //   if (!userToken) {
  //     return toast.error(
  //       "Bạn chưa đăng nhập! Vui lòng đăng nhập để bình luận."
  //     );
  //   }
  //   if (!newComment.trim()) {
  //     return toast.error("Bình luận không được để trống!");
  //   }

  //   try {
  //     await addComment({ content: newComment, recipe_id: recipeId }, userToken);
  //     setNewComment("");
  //     loadComments();
  //   } catch (error) {
  //     console.error("Lỗi khi thêm bình luận:", error);
  //   }
  // };

  const handleAddComment = async () => {
    if (!userToken) {
      return toast.error(
        "Bạn chưa đăng nhập! Vui lòng đăng nhập để bình luận."
      );
    }

    const trimmedComment = newComment.trim();
    if (!trimmedComment) {
      return toast.error("Bình luận không được để trống!");
    }

    const bannedWords = [
      "đm",
      "dm",
      "vkl",
      "vcl",
      "vcc",
      "cl",
      "cc",
      "cmm",
      "con đĩ",
      "con chó",
      "địt",
      "lồn",
      "buồi",
      "cặc",
      "đéo",
      "cái l**",
      "điên",
      "ngu",
      "óc chó",
      "thằng ngu",
      "đồ ngu",
      "khùng",
      "mất dạy",
      "súc vật",
    ];
    const containsBadWords = bannedWords.some((word) =>
      trimmedComment.toLowerCase().includes(word)
    );
    if (containsBadWords) {
      return toast.error("Bình luận chứa từ ngữ không phù hợp!");
    }

    try {
      await addComment(
        { content: trimmedComment, recipe_id: recipeId },
        userToken
      );
      setNewComment("");
      loadComments();
    } catch (error) {
      console.error("Lỗi khi thêm bình luận:", error);
    }
  };

  const handleDeleteComment = async (commentId) => {
    if (!userToken) {
      return toast.error(
        "Bạn chưa đăng nhập! Vui lòng đăng nhập để xóa bình luận."
      );
    }

    try {
      await deleteComment(commentId, userToken);
      loadComments();
    } catch (error) {
      console.error("Lỗi khi xóa bình luận:", error);
    }
  };

  const handleEditClick = (comment) => {
    setEditingComment(comment.id);
    setUpdatedContent(comment.content);
  };

  const handleUpdateComment = async (commentId) => {
    if (!userToken) {
      return toast.error(
        "Bạn chưa đăng nhập! Vui lòng đăng nhập để chỉnh sửa bình luận."
      );
    }
    if (!updatedContent.trim()) {
      return toast.error("Nội dung chỉnh sửa không được để trống!");
    }

    try {
      await updateComment(commentId, updatedContent, userToken);
      setEditingComment(null);
      setUpdatedContent("");
      loadComments();
    } catch (error) {
      console.error("Lỗi khi cập nhật bình luận:", error);
    }
  };

  return (
    <div className="comment-section  mx-auto px-4 py-6 bg-white rounded-xl shadow-md">
      <h3 className="text-3xl font-semibold mb-4 border-b pb-2">
        Bình luận về món ăn
      </h3>

      <div className="space-y-4 mb-6">
        {comments.map((comment) => (
          <div
            key={comment.id}
            className="bg-gray-100 p-4 rounded-lg shadow-sm"
          >
            {editingComment === comment.id ? (
              <div className="space-y-2">
                <input
                  type="text"
                  maxLength={100}
                  value={updatedContent}
                  onChange={(e) => setUpdatedContent(e.target.value)}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring focus:ring-blue-200"
                />
                <div className="flex gap-2">
                  <button
                    onClick={() => handleUpdateComment(comment.id)}
                    className="px-4 py-1 bg-blue-500 text-white rounded hover:bg-blue-600"
                  >
                    Cập nhật
                  </button>
                  <button
                    onClick={() => setEditingComment(null)}
                    className="px-4 py-1 bg-gray-300 text-gray-700 rounded hover:bg-gray-400"
                  >
                    Hủy
                  </button>
                </div>
              </div>
            ) : (
              <>
                <div className="text-sm text-gray-500 flex mb-2 gap-3">
                  <div className="w-14 h-14 rounded-full overflow-hidden">
                    <img
                      src={`http://localhost:3000/${comment.avatar}`}
                      alt=""
                      className="w-full h-full object-cover"
                    />
                  </div>{" "}
                  <span className="text-2xl mt-2 font-semibold">
                    {comment.name || "Ẩn danh"}
                  </span>
                </div>
                <div className="flex items-center justify-between ml-20">
                  <p className="text-gray-800 mb-1 text-lg">
                    {comment.content}
                  </p>

                  {comment.user_id === currentUserId && (
                    <div className="flex gap-2">
                      <button
                        onClick={() => handleEditClick(comment)}
                        className="text-blue-500 hover:underline"
                      >
                        Chỉnh sửa
                      </button>
                      <button
                        onClick={() => handleDeleteComment(comment.id)}
                        className="text-red-500 hover:underline"
                      >
                        Xóa
                      </button>
                    </div>
                  )}
                </div>
              </>
            )}
          </div>
        ))}
      </div>
      <p className="text-sm text-gray-500 text-left w-full">
        {newComment.length}/200
      </p>
      <div className="add-comment flex gap-2 items-center">
        <input
          type="text"
          maxLength={200}
          value={newComment}
          onChange={(e) => setNewComment(e.target.value)}
          placeholder="Thêm bình luận..."
          className="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring focus:ring-blue-200"
        />

        <button
          onClick={handleAddComment}
          className="px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600"
        >
          Gửi
        </button>
      </div>
    </div>
  );
};

export default CommentSection;
