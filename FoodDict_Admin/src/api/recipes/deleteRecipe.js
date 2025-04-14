import axios from "axios";
import { toast } from "react-toastify";
const deleteRecipe = async (id, onDeleteSuccess) => {
  const confirmDelete = window.confirm(
    "Bạn có chắc chắn muốn xóa công thức này?"
  );
  if (!confirmDelete) return;

  try {
    await axios.delete(`http://localhost:3000/recipe/${id}`);
    toast.success("Xóa công thức thành công!");
    if (onDeleteSuccess) onDeleteSuccess(id);
  } catch (error) {
    console.error("Lỗi khi xóa công thức:", error);
    alert("Xóa không thành công. Vui lòng thử lại.");
  }
};

export default deleteRecipe;
