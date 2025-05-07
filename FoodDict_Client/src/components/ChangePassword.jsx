import { useState } from "react";
import axios from "axios";

function ChangePassword({ setIsChangingPassword }) {
  const [passwordData, setPasswordData] = useState({
    password: "",
    newPassword: "",
    confirmNewPassword: "",
  });
  const [passwordMessage, setPasswordMessage] = useState("");

  const handlePasswordChange = (e) => {
    setPasswordData({
      ...passwordData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmitPasswordChange = async (e) => {
    e.preventDefault();

    if (passwordData.newPassword !== passwordData.confirmNewPassword) {
      setPasswordMessage("Mật khẩu mới và xác nhận mật khẩu không khớp!");
      return;
    }

    try {
      const token = localStorage.getItem("token"); // 👈 lấy token từ localStorage

      const response = await axios.put(
        "http://localhost:3000/api/users/change_password",
        {
          password: passwordData.password,
          newPassword: passwordData.newPassword,
        },
        {
          headers: {
            Authorization: `Bearer ${token}`, // 👈 thêm token vào headers
          },
        }
      );
      setPasswordMessage(response.data.message);
      setPasswordData({
        password: "",
        newPassword: "",
        confirmNewPassword: "",
      });
    } catch (error) {
      setPasswordMessage(
        error.response?.data?.message || "Đổi mật khẩu thất bại!"
      );
    }
  };

  return (
    <div className="mt-8">
      <h3 className="text-lg font-semibold mb-2">Đổi mật khẩu</h3>
      <form onSubmit={handleSubmitPasswordChange} className="space-y-4">
        <div>
          <label>Mật khẩu hiện tại:</label>
          <input
            type="password"
            name="password"
            value={passwordData.password}
            onChange={handlePasswordChange}
            className="border p-2 w-full rounded"
            required
          />
        </div>
        <div>
          <label>Mật khẩu mới:</label>
          <input
            type="password"
            name="newPassword"
            value={passwordData.newPassword}
            onChange={handlePasswordChange}
            className="border p-2 w-full rounded"
            required
          />
        </div>
        <div>
          <label>Xác nhận mật khẩu mới:</label>
          <input
            type="password"
            name="confirmNewPassword"
            value={passwordData.confirmNewPassword}
            onChange={handlePasswordChange}
            className="border p-2 w-full rounded"
            required
          />
        </div>
        <div className="flex gap-3">
          <button
            type="submit"
            className="bg-blue-500 text-white px-4 py-2 rounded"
          >
            Đổi mật khẩu
          </button>
          <button
            onClick={() => setIsChangingPassword(false)}
            className="bg-slate-500 text-white px-4 py-2 rounded"
          >
            Ẩn
          </button>
        </div>
      </form>
      {passwordMessage && (
        <p className="mt-2 text-red-500">{passwordMessage}</p>
      )}
    </div>
  );
}

export default ChangePassword;
