import React, { useEffect, useState } from "react";
import { deleteComment, searchComment } from "../api/commentApi";
import { toast } from "react-toastify";

function Comment() {
  const [listComment, setListComment] = useState([]);
  const [pagination, setPagination] = useState({
    page: 1,
    limit: 5,
    totalPages: 1,
  });
  const [search, setSearch] = useState(""); // state lưu từ khóa tìm kiếm

  // Hàm tải dữ liệu bình luận theo trang và từ khóa search
  const loadComment = async (page = 1, searchValue = "") => {
    try {
      const res = await searchComment(page, pagination.limit, searchValue);
      setListComment(res.data);
      setPagination(res.pagination);
    } catch (error) {
      console.error("Lỗi khi load bình luận:", error);
    }
  };

  // Load comment khi mount component hoặc khi page/search thay đổi
  useEffect(() => {
    loadComment(pagination.page, search);
  }, [pagination.page, search]);

  // Xử lý đổi trang
  const handlePageChange = (newPage) => {
    if (newPage < 1 || newPage > pagination.totalPages) return;
    setPagination((prev) => ({ ...prev, page: newPage }));
  };

  // Xử lý xóa bình luận
  const handleDeleteComment = async (commentId) => {
    const confirmed = window.confirm("Bạn có chắc muốn xóa bình luận này?");
    if (!confirmed) return;

    const result = await deleteComment(commentId);
    if (result) {
      toast.success("Xóa bình luận thành công!");
      loadComment(pagination.page, search);
    }
  };

  // Định dạng ngày theo chuẩn Việt Nam
  const formatDateVN = (dateString) => {
    if (!dateString) return null;
    const date = new Date(dateString);
    return date.toLocaleDateString("vi-VN");
  };

  // Xử lý thay đổi input tìm kiếm
  const handleSearchChange = (e) => {
    setSearch(e.target.value);
    setPagination((prev) => ({ ...prev, page: 1 }));
  };

  return (
    <div className="bg-[#F9FAFF] min-h-screen p-6">
      <h3 className="text-3xl font-bold mb-4">Danh sách bình luận</h3>

      {/* Input tìm kiếm */}
      <div className="mb-4">
        <input
          type="text"
          placeholder="Tìm kiếm theo tên người dùng hoặc nội dung bình luận..."
          value={search}
          onChange={handleSearchChange}
          className="w-[85%] p-2 border border-gray-300 rounded"
        />
      </div>

      {listComment.length > 0 ? (
        <>
          <div className="overflow-y-auto min-h-[450px]">
            <table className="w-[85%] border-collapse">
              <thead className="bg-gray-100 sticky top-0 z-10">
                <tr>
                  <th className="px-4 py-3 text-left w-1/6">Nội dung</th>
                  <th className="px-4 py-3 w-1/6">Tên người comment</th>
                  <th className="px-4 py-3 w-1/6">Ảnh người comment</th>
                  <th className="px-4 py-3 w-1/6">Tên công thức</th>
                  <th className="px-4 py-3 w-1/6">Ngày comment</th>
                  <th className="px-4 py-3 w-1/6">Hành động</th>
                </tr>
              </thead>
              <tbody>
                {listComment.map((comment) => (
                  <tr
                    key={comment.id}
                    className="hover:bg-gray-50 even:bg-gray-50"
                  >
                    <td className="px-4 py-3 border h-16 max-w-xs truncate">
                      <span className="font-medium">{comment.content}</span>
                    </td>
                    <td className="px-4 py-3 border h-16 max-w-xs truncate">
                      <span className="font-medium">{comment.user_name}</span>
                    </td>
                    <td className="px-4 py-3 border h-16 max-w-xs ">
                      <div className="h-20 w-20">
                        <img
                          src={`http://localhost:3000/${comment.avatar}`}
                          alt=""
                          className="w-full h-full object-cover"
                        />
                      </div>
                    </td>
                    <td className="px-4 py-3 border h-16 max-w-xs truncate">
                      <span className="font-medium">{comment.recipe_name}</span>
                    </td>
                    <td className="px-4 py-3 border h-16 max-w-xs truncate">
                      <span className="font-medium">
                        {formatDateVN(comment.created_at)}
                      </span>
                    </td>
                    <td className="px-4 border h-16 text-center">
                      <button
                        className="text-green-600 hover:text-green-800 hover:underline transition-colors"
                        onClick={() => handleDeleteComment(comment.id)}
                      >
                        Xóa bình luận
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          {/* PHÂN TRANG */}
          <div className="mt-4 flex items-center gap-2">
            <button
              className="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300"
              onClick={() => handlePageChange(pagination.page - 1)}
              disabled={pagination.page <= 1}
            >
              &lt;
            </button>
            {Array.from({ length: pagination.totalPages }, (_, i) => (
              <button
                key={i + 1}
                onClick={() => handlePageChange(i + 1)}
                className={`px-3 py-1 rounded ${
                  pagination.page === i + 1
                    ? "bg-blue-500 text-white"
                    : "bg-gray-200 hover:bg-gray-300"
                }`}
              >
                {i + 1}
              </button>
            ))}
            <button
              className="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300"
              onClick={() => handlePageChange(pagination.page + 1)}
              disabled={pagination.page >= pagination.totalPages}
            >
              &gt;&gt;
            </button>
          </div>
        </>
      ) : (
        <p>Chưa có bình luận</p>
      )}
    </div>
  );
}

export default Comment;
