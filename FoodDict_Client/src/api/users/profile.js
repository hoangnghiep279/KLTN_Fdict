import axios from "axios";
import { toast } from "react-toastify";

const getProfileUser = async (setUser, setIsAuthenticated) => {
  try {
    const token = localStorage.getItem("token");
    if (!token) {
      setIsAuthenticated(false);
      return;
    }

    const response = await axios.get(
      "http://localhost:3000/api/users/profile",
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    if (response && response.data && response.data.data) {
      setUser(response.data.data);
      setIsAuthenticated(true);
    } else {
      toast("Không thể lấy thông tin người dùng", { type: "error" });
      setIsAuthenticated(false);
    }
  } catch (error) {
    console.error("Lỗi khi lấy thông tin người dùng:", error);
    if (error.response && error.response.status === 401) {
      localStorage.removeItem("token");
      setIsAuthenticated(false);
      toast("Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.", {
        type: "warning",
      });
    } else {
      toast("Lỗi máy chủ hoặc không thể kết nối", { type: "error" });
    }
  }
};

export default getProfileUser;
