import axios from "axios";
import { toast } from "react-toastify";
import { Validation } from "../../utils/validation";
const registerUser = async (values, setError, setIsLogin) => {
  try {
    await axios.post("http://localhost:3000/api/users/register", {
      name: values.name,
      email: values.email,
      password: values.password,
      gender: values.gender,
      birthday: values.birthday,
    });
    toast("Đăng ký tài khoản thanh công", { type: "success" });
    setIsLogin(true);
  } catch (error) {
    if (error.response && error.response.status === 401) {
      setError({ email: "Email đã tồn tại. Vui lòng chọn email khác." });
    } else {
      setError(Validation(values));
    }
  }
};

export default registerUser;
