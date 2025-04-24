import React, { useEffect, useState } from "react";
import getProfileUser from "../api/users/profile"; // đường dẫn tuỳ bạn đặt
import { useNavigate } from "react-router-dom";

function Profile() {
  const [user, setUser] = useState(null);
  const [isAuthenticated, setIsAuthenticated] = useState(true);
  const navigate = useNavigate();

  useEffect(() => {
    getProfileUser(setUser, setIsAuthenticated);
  }, []);

  useEffect(() => {
    if (!isAuthenticated) {
      navigate("/"); // Nếu chưa đăng nhập, chuyển về trang đăng nhập
    }
  }, [isAuthenticated, navigate]);

  if (!user) {
    return <div>Đang tải thông tin người dùng...</div>;
  }

  return (
    <div>
      <h2>Thông tin cá nhân</h2>
      <p>
        <strong>Họ tên:</strong> {user.name}
      </p>
      <p>
        <strong>Email:</strong> {user.email}
      </p>
      <p>
        <strong>Giới tính:</strong> {user.gender}
      </p>
      <p>
        <strong>Ngày sinh:</strong> {user.birthday}
      </p>
      <img src={`http://localhost:3000/${user.avatar}`} alt="" />
    </div>
  );
}

export default Profile;
