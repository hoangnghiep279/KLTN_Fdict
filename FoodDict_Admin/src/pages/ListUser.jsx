import React, { useEffect, useState } from "react";
import { fetchListUser, banUser, unbanUser } from "../api/user";
import { toast } from "react-toastify";

function ListUser() {
  const [listUser, setListUser] = useState([]);

  const loadUsers = async () => {
    try {
      const data = await fetchListUser();
      setListUser(data);
    } catch (error) {
      console.error("Lỗi khi load danh sách người dùng:", error);
    }
  };

  useEffect(() => {
    loadUsers();
  }, []);

  // Hàm định dạng ngày kiểu Việt Nam
  const formatDateVN = (dateString) => {
    if (!dateString) return null;
    const date = new Date(dateString);
    return date.toLocaleDateString("vi-VN");
  };

  const handleBanUser = async (userId) => {
    const days = prompt("Nhập số ngày muốn ban người dùng:");
    if (!days || isNaN(days) || days <= 0) {
      toast.warning("Vui lòng nhập số ngày hợp lệ!");
      return;
    }

    try {
      await banUser(userId, Number(days));
      await loadUsers();
    } catch (error) {
      console.error("Lỗi khi ban người dùng:", error);
    }
  };

  const handleUnbanUser = async (userId) => {
    try {
      await unbanUser(userId);
      await loadUsers();
    } catch (error) {
      console.error("Lỗi khi bỏ ban người dùng:", error);
    }
  };

  return (
    <div className="bg-[#F9FAFF] h-screen p-6">
      <h3 className="text-3xl font-bold mb-4">Danh sách người dùng</h3>
      {listUser.length > 0 ? (
        <div className="overflow-y-auto min-h-[450px]">
          <table className="w-[85%] border-collapse">
            <thead className="bg-gray-100 sticky top-0 z-10">
              <tr>
                <th className="px-4 py-3 text-left w-1/6">Tên</th>
                <th className="px-4 py-3 w-1/6">Ngày tạo</th>
                <th className="px-4 py-3 w-1/6">Giới tính</th>
                <th className="px-4 py-3 w-1/6">Ngày hết ban</th>
                <th className="px-4 py-3 w-1/6">Hành động</th>
                <th className="px-4 py-3 w-1/6">Hành động</th>
              </tr>
            </thead>
            <tbody>
              {listUser.map((user) => (
                <tr key={user.id} className="hover:bg-gray-50 even:bg-gray-50">
                  <td className="px-4 py-3 border h-16 max-w-xs truncate">
                    <span className="font-medium">{user.name}</span>
                  </td>
                  <td className="px-4 py-3 border h-16 max-w-xs truncate">
                    <span className="font-medium">
                      {formatDateVN(user.created_at)}
                    </span>
                  </td>
                  <td className="px-4 py-3 border h-16 max-w-xs truncate">
                    <span className="font-medium">
                      {user.gender === 1 ? "Nam" : "Nữ"}
                    </span>
                  </td>
                  <td className="px-4 py-3 border h-16 max-w-xs truncate">
                    <span className="font-medium">
                      {user.banned_until
                        ? formatDateVN(user.banned_until)
                        : "Không ban"}
                    </span>
                  </td>
                  <td className="px-4 border h-16 text-center">
                    <button
                      className="text-red-600 hover:text-red-800 hover:underline transition-colors"
                      onClick={() => handleBanUser(user.id)}
                    >
                      Ban người dùng
                    </button>
                  </td>
                  <td className="px-4 border h-16 text-center">
                    <button
                      className="text-green-600 hover:text-green-800 hover:underline transition-colors"
                      onClick={() => handleUnbanUser(user.id)}
                    >
                      Bỏ ban
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p>Chưa có người dùng</p>
      )}
    </div>
  );
}

export default ListUser;
