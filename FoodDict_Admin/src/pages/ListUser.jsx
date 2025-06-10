import React, { useEffect, useState } from "react";
import { fetchListUser, banUser, unbanUser } from "../api/user";
import { toast } from "react-toastify";
import Pagination from "../components/Pagination";

function ListUser() {
  const [listUser, setListUser] = useState([]);
  const [page, setPage] = useState(1);
  const [limit, setLimit] = useState(10);
  const [totalPages, setTotalPages] = useState(1);
  const [search, setSearch] = useState("");

  const loadUsers = async () => {
    try {
      const result = await fetchListUser(page, limit, search);
      setListUser(result.data);
      setTotalPages(result.pagination.totalPages);
    } catch (error) {
      console.error("Lỗi khi load danh sách người dùng:", error);
    }
  };

  useEffect(() => {
    loadUsers();
  }, [page, limit, search]);

  const formatDateVN = (dateString) => {
    if (!dateString) return null;
    const date = new Date(dateString);
    return date.toLocaleDateString("vi-VN");
  };

  const handleBanUser = async (userId, userName) => {
    const days = prompt(`Nhập số ngày muốn ban người dùng "${userName}":`);
    if (!days || isNaN(days) || days <= 0) {
      toast.warning("Vui lòng nhập số ngày hợp lệ!");
      return;
    }

    try {
      const result = await banUser(userId, {
        name: userName,
        days: Number(days),
      });

      toast.success(result.message); // Backend đã xử lý message chuẩn
      await loadUsers();
    } catch (error) {
      console.error("Lỗi khi ban người dùng:", error);
    }
  };

  const handleUnbanUser = async (userId, userName) => {
    try {
      const result = await unbanUser(userId, { name: userName });
      toast.success(result.message);
      await loadUsers();
    } catch (error) {
      console.error("Lỗi khi bỏ ban người dùng:", error);
    }
  };

  const handleSearchChange = (e) => {
    setSearch(e.target.value);
    setPage(1); // Reset về trang đầu khi tìm kiếm
  };

  return (
    <div className="bg-[#F9FAFF] min-h-screen p-6">
      <h3 className="text-3xl font-bold mb-4">Danh sách người dùng</h3>

      <div className="mb-4">
        <input
          type="text"
          placeholder="Tìm kiếm theo tên..."
          value={search}
          onChange={handleSearchChange}
          className="px-3 py-2 border border-gray-300 rounded-md w-80"
        />
      </div>

      {listUser.length > 0 ? (
        <>
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
                  <tr
                    key={user.id}
                    className="hover:bg-gray-50 even:bg-gray-50"
                  >
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
                        onClick={() => handleBanUser(user.id, user.name)}
                      >
                        Ban người dùng
                      </button>
                    </td>
                    <td className="px-4 border h-16 text-center">
                      <button
                        className="text-green-600 hover:text-green-800 hover:underline transition-colors"
                        onClick={() => handleUnbanUser(user.id, user.name)}
                      >
                        Bỏ ban
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <Pagination
            page={page}
            totalPages={totalPages}
            setPage={setPage}
            limit={limit}
            setLimit={setLimit}
          />
        </>
      ) : (
        <p>Chưa có người dùng</p>
      )}
    </div>
  );
}

export default ListUser;
