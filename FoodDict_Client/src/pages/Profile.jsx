import React, { useEffect, useState } from "react";
import getProfileUser from "../api/users/profile";
import { useNavigate } from "react-router-dom";
import updateProfileUser from "../api/users/updateProfile";

function Profile() {
  const [user, setUser] = useState(null);
  const [isAuthenticated, setIsAuthenticated] = useState(true);
  const [isEditing, setIsEditing] = useState(false);
  const [editedUser, setEditedUser] = useState({});
  const [selectedAvatar, setSelectedAvatar] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    getProfileUser(setUser, setIsAuthenticated, navigate);
  }, [navigate]);

  useEffect(() => {
    if (!isAuthenticated) {
      navigate("/");
    }
  }, [isAuthenticated, navigate]);

  const handleEdit = () => {
    setEditedUser(user);
    setIsEditing(true);
  };

  const handleCancel = () => {
    setIsEditing(false);
    setSelectedAvatar(null);
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setEditedUser((prev) => ({ ...prev, [name]: value }));
  };

  const handleAvatarChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      setSelectedAvatar(file);
    }
  };

  const handleSave = async () => {
    try {
      const formData = new FormData();
      formData.append("name", editedUser.name);
      formData.append("email", editedUser.email);
      formData.append("gender", editedUser.gender ?? "");
      formData.append("birthday", editedUser.birthday ?? "");
      if (selectedAvatar) {
        formData.append("avatar", selectedAvatar);
      }

      const updatedUser = await updateProfileUser(formData); // gọi API update (lưu ý update API nhận formData)

      setUser(updatedUser); // cập nhật lại user mới
      setIsEditing(false);
      setSelectedAvatar(null);
    } catch (error) {
      console.error("Cập nhật thất bại:", error);
    }
  };

  if (!user) {
    return <div>Đang tải thông tin người dùng...</div>;
  }

  return (
    <div>
      <div className="box-shadow flex items-center p-5 gap-8 container">
        <div className="w-28 h-28 rounded-full overflow-hidden bg-slate-100">
          <img
            src={
              selectedAvatar
                ? URL.createObjectURL(selectedAvatar)
                : `http://localhost:3000/${user.avatar}`
            }
            className="w-full h-full object-cover"
            alt="Avatar"
          />
        </div>
        <div>
          <p className="text-2xl font-extrabold uppercase mb-3">{user.name}</p>
          <span className="px-2 py-1 border-primaryColor rounded-xl border">
            thành viên
          </span>
        </div>
      </div>

      <div className="p-5">
        {isEditing && (
          <div className="mb-4">
            <strong>Đổi ảnh đại diện:</strong>{" "}
            <input type="file" accept="image/*" onChange={handleAvatarChange} />
          </div>
        )}

        <div className="mb-4">
          <strong>Họ tên:</strong>{" "}
          {isEditing ? (
            <input
              name="name"
              value={editedUser.name}
              onChange={handleChange}
              className="border p-1 ml-2"
            />
          ) : (
            user.name
          )}
        </div>

        <div className="mb-4">
          <strong>Email:</strong>{" "}
          {isEditing ? (
            <input
              name="email"
              value={editedUser.email}
              onChange={handleChange}
              className="border p-1 ml-2"
            />
          ) : (
            user.email
          )}
        </div>

        <div className="mb-4">
          <strong>Giới tính:</strong>{" "}
          {isEditing ? (
            <select
              name="gender"
              value={editedUser.gender}
              onChange={handleChange}
              className="border p-1 ml-2"
            >
              <option value="">--Chọn giới tính--</option>
              <option value="0">Nam</option>
              <option value="1">Nữ</option>
            </select>
          ) : user.gender === 0 ? (
            "Nam"
          ) : user.gender === 1 ? (
            "Nữ"
          ) : (
            ""
          )}
        </div>

        <div className="mb-4">
          <strong>Ngày sinh:</strong>{" "}
          {isEditing ? (
            <input
              type="date"
              name="birthday"
              value={editedUser.birthday || ""}
              onChange={handleChange}
              className="border p-1 ml-2"
            />
          ) : (
            user.birthday
          )}
        </div>

        <div className="mt-4">
          {isEditing ? (
            <>
              <button
                onClick={handleSave}
                className="bg-green-500 text-white px-4 py-2 rounded mr-2"
              >
                Lưu
              </button>
              <button
                onClick={handleCancel}
                className="bg-gray-400 text-white px-4 py-2 rounded"
              >
                Hủy
              </button>
            </>
          ) : (
            <button
              onClick={handleEdit}
              className="bg-blue-500 text-white px-4 py-2 rounded"
            >
              Sửa thông tin
            </button>
          )}
        </div>
      </div>
    </div>
  );
}

export default Profile;
