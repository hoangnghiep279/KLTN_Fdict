import React, { useEffect, useState } from "react";
import {
  fetchMealType,
  deleteMealType,
  updateMealType,
  insertMealType,
} from "../api/linkrecipe/mealtype";
import { toast } from "react-toastify";

function MealType() {
  const [mealType, setMealType] = useState([]);
  const [editingId, setEditingId] = useState(null);
  const [editValue, setEditValue] = useState("");
  const [addingMode, setAddingMode] = useState(false);
  const [newMealTypeName, setNewMealTypeName] = useState("");

  const loadMealType = async () => {
    const data = await fetchMealType();
    setMealType(data);
  };

  // Load dữ liệu
  useEffect(() => {
    loadMealType();
  }, []);

  // Xử lý xóa
  const handleDelete = async (id) => {
    const confirmDelete = window.confirm(
      "Bạn có chắc chắn muốn xóa mục này không?"
    );
    if (!confirmDelete) return;

    try {
      await deleteMealType(id);
      setMealType((prev) => prev.filter((item) => item.id !== id));
    } catch (error) {
      console.error("Xóa thất bại:", error);
    }
  };

  // Bắt đầu sửa
  const handleEdit = (id, name) => {
    setEditingId(id);
    setEditValue(name);
  };

  // Hủy sửa
  const handleCancelEdit = () => {
    setEditingId(null);
    setEditValue("");
  };

  // Lưu chỉnh sửa
  const handleSave = async (id) => {
    try {
      await updateMealType(id, { name: editValue });

      setMealType((prev) =>
        prev.map((item) =>
          item.id === id ? { ...item, name: editValue } : item
        )
      );

      handleCancelEdit();
    } catch (error) {
      console.error("Cập nhật thất bại:", error);
    }
  };

  // Thêm loại món ăn mới
  const handleAddMealType = async () => {
    if (!newMealTypeName.trim()) {
      toast.warning("Vui lòng nhập tên loại món ăn");
      return;
    }

    try {
      const newItem = await insertMealType({ name: newMealTypeName });

      // Nếu newItem.data tồn tại => lấy newItem.data
      if (newItem?.data?.id) {
        setMealType((prev) => [...prev, newItem.data]);
      } else if (newItem?.id) {
        setMealType((prev) => [...prev, newItem]);
      } else {
        setNewMealTypeName("");
        setAddingMode(false);
        loadMealType();
      }
    } catch (error) {
      console.error("Thêm thất bại:", error);
    }
  };

  return (
    <div className="bg-[#F9FAFF] h-screen p-6">
      <h3 className="text-3xl font-bold mb-4">Danh sách loại món ăn</h3>

      {/* Nút thêm */}
      <div className="mb-4">
        {!addingMode ? (
          <button
            onClick={() => setAddingMode(true)}
            className="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600"
          >
            + Thêm loại món ăn
          </button>
        ) : (
          <div className="flex items-center gap-2">
            <input
              type="text"
              value={newMealTypeName}
              onChange={(e) => setNewMealTypeName(e.target.value)}
              className="border border-gray-300 p-2 rounded w-64"
              placeholder="Nhập tên loại món ăn"
            />
            <button
              onClick={handleAddMealType}
              className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
            >
              Lưu
            </button>
            <button
              onClick={() => {
                setAddingMode(false);
                setNewMealTypeName("");
              }}
              className="bg-gray-300 text-black px-4 py-2 rounded hover:bg-gray-400"
            >
              Hủy
            </button>
          </div>
        )}
      </div>

      {/* Bảng danh sách */}
      {!addingMode && mealType.length > 0 ? (
        <div className="overflow-y-auto min-h-[450px]">
          <table className="w-[85%] border-collapse">
            <thead className="bg-gray-100 sticky top-0 z-10">
              <tr>
                <th className="px-4 py-2 text-left w-2/6">Tên loại món ăn</th>
                <th className="px-4 py-2 w-1/6">Sửa</th>
                <th className="px-4 py-2 w-1/6">Xóa</th>
              </tr>
            </thead>
            <tbody>
              {mealType.map((item) => (
                <tr key={item.id} className="hover:bg-gray-50 even:bg-gray-50">
                  <td className="px-4 py-2 border h-12">
                    {editingId === item.id ? (
                      <input
                        type="text"
                        value={editValue}
                        onChange={(e) => setEditValue(e.target.value)}
                        className="w-full border p-1 rounded"
                      />
                    ) : (
                      <span title={item.name} className="font-medium">
                        {item.name}
                      </span>
                    )}
                  </td>

                  <td className="px-4 border h-12 text-center">
                    {editingId === item.id ? (
                      <div className="flex justify-center gap-2">
                        <button
                          onClick={() => handleSave(item.id)}
                          className="text-blue-600 hover:underline"
                        >
                          Lưu
                        </button>
                        <button
                          onClick={handleCancelEdit}
                          className="text-gray-600 hover:underline"
                        >
                          Hủy
                        </button>
                      </div>
                    ) : (
                      <button
                        onClick={() => handleEdit(item.id, item.name)}
                        className="text-green-600 hover:text-green-800 hover:underline"
                      >
                        Sửa
                      </button>
                    )}
                  </td>

                  <td className="px-4 border h-12 text-center">
                    <button
                      onClick={() => handleDelete(item.id)}
                      className="text-red-600 hover:text-red-800 hover:underline"
                    >
                      Xóa
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : null}

      {/* Nếu danh sách rỗng */}
      {!addingMode && mealType.length === 0 && (
        <p>Chưa có loại loại món ăn nào</p>
      )}
    </div>
  );
}

export default MealType;
