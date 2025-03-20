import axios from "axios";
import { toast } from "react-toastify";
const loginUser = async (values, setError) => {
  try {
    const response = await axios.post(
      "http://localhost:3000/api/users/user-login",
      {
        email: values.email,
        password: values.password,
      }
    );

    if (response && response.data.data && response.data.data.token) {
      localStorage.setItem("token", response.data.data.token);
      toast("Đăng nhập thành công", { type: "success" });
      window.location.reload();
    } else {
      toast("Token không hợp lệ", { type: "error" });
    }
  } catch (error) {
    if (error.response && error.response.data && error.response.data.message) {
      toast(error.response.data.message, { type: "error" });
      setError({ serverError: error.response.data.message });
    } else {
      toast("Đăng nhập thất bại", { type: "error" });
    }
  }
};

export default loginUser;
