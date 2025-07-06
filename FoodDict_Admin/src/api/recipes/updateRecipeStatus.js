import axios from "axios";
import { toast } from "react-toastify";

const API_URL = "http://localhost:3000/recipe/admin/update-status";

const updateRecipeStatus = async (id, status) => {
  try {
    const token = localStorage.getItem("token");
    const response = await axios.patch(
      `${API_URL}/${id}`,
      { status },
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    toast.success("Cập nhật trạng thái công thức thành công!");
    return response.data;
  } catch (error) {
    console.error("Lỗi khi cập nhật trạng thái công thức:", error);
    toast.error("Không thể cập nhật trạng thái.");
    throw error;
  }
};

export default updateRecipeStatus;
