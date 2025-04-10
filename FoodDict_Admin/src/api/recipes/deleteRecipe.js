// ✅ Cách 1: dùng export default
const deleteRecipe = async (id, onDeleteSuccess) => {
  const confirmDelete = window.confirm(
    "Bạn có chắc chắn muốn xóa công thức này?"
  );
  if (!confirmDelete) return;

  try {
    await axios.delete(`http://localhost:3000/recipes/${id}`);
    alert("Xóa công thức thành công!");
    if (onDeleteSuccess) onDeleteSuccess(id);
  } catch (error) {
    console.error("Lỗi khi xóa công thức:", error);
    alert("Xóa không thành công. Vui lòng thử lại.");
  }
};

export default deleteRecipe;
