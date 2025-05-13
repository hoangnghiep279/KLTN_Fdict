import React, { useEffect, useState } from "react";
import getProfileUser from "../api/users/profile";
import updateProfileUser from "../api/users/updateProfile";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import ChangePassword from "../components/ChangePassword";
function Profile() {
  const [user, setUser] = useState(null);
  const [isAuthenticated, setIsAuthenticated] = useState(true);
  const [isEditing, setIsEditing] = useState(false);
  const [editedUser, setEditedUser] = useState({});
  const [selectedAvatar, setSelectedAvatar] = useState(null);
  const navigate = useNavigate();
  const [isChangingPassword, setIsChangingPassword] = useState(false);

  useEffect(() => {
    getProfileUser(setUser, setIsAuthenticated, navigate);
  }, [navigate]);

  useEffect(() => {
    if (!isAuthenticated) {
      navigate("/");
    }
  }, [isAuthenticated, navigate]);

  const handleEdit = () => {
    setEditedUser(user); // copy dữ liệu gốc vào form
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
      formData.append("name", editedUser.name || "");
      formData.append("email", editedUser.email || "");
      formData.append("gender", editedUser.gender ?? "");
      formData.append("birthday", editedUser.birthday ?? "");
      if (selectedAvatar) {
        formData.append("avatar", selectedAvatar);
      }

      const updated = await updateProfileUser(formData);

      toast.success(updated.message || "Cập nhật thành công!");

      // Sau khi cập nhật thành công, load lại dữ liệu mới từ API
      await getProfileUser(setUser, setIsAuthenticated, navigate);

      setIsEditing(false);
      setSelectedAvatar(null);
    } catch (error) {
      console.error("Cập nhật thất bại:", error);
      toast.error(error.response?.data?.message || "Cập nhật thất bại");
    }
  };

  if (!user) {
    return <div>Đang tải thông tin người dùng...</div>;
  }

  return (
    <div>
      <div className="flex items-center gap-8 mb-6 box-shadow container py-7">
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
          <p className="text-2xl font-bold">{user.name}</p>
          <span className="text-gray-500">Thành viên</span>
        </div>
      </div>
      <div className="my-16"></div>
      <div className=" container ">
        <h3 className="text-2xl font-bold uppercase mb-6">Cài đặt tài khoản</h3>

        {isEditing && (
          <div className="mb-4 flex items-center">
            <span className="text-lg">Ảnh đại diện:</span>{" "}
            <input type="file" accept="image/*" onChange={handleAvatarChange} />
          </div>
        )}
        <div className="grid grid-cols-2">
          <div className="mb-4 flex items-center gap-3">
            <span className="text-lg">Họ tên:</span>{" "}
            {isEditing ? (
              <input
                name="name"
                value={editedUser.name}
                onChange={handleChange}
                className="border p-2 ml-2 rounded"
              />
            ) : (
              <span className="border py-1 px-3 rounded-lg bg-[#dfcec41b] border-[#cbb1a2]">
                {user.name}
              </span>
            )}
          </div>

          <div className="mb-4 flex items-center gap-3">
            <span className="text-lg">Email:</span>{" "}
            {isEditing ? (
              <input
                name="email"
                value={editedUser.email}
                onChange={handleChange}
                className="border p-2 ml-2 rounded"
              />
            ) : (
              <span className="border py-1 px-3 rounded-lg bg-[#dfcec41b] border-[#cbb1a2]">
                {user.email}
              </span>
            )}
          </div>

          <div className="mb-4 flex items-center gap-3">
            <span className="text-lg">Giới tính:</span>{" "}
            {isEditing ? (
              <select
                name="gender"
                value={editedUser.gender ?? ""}
                onChange={handleChange}
                className="border p-2 ml-2 rounded"
              >
                <option value="">--Chọn giới tính--</option>
                <option value="1">Nam</option>
                <option value="2">Nữ</option>
              </select>
            ) : user.gender === 1 ? (
              <span className="border py-1 px-3 rounded-lg bg-[#dfcec41b] border-[#cbb1a2]">
                Nam
              </span>
            ) : user.gender === 2 ? (
              <span className="border py-1 px-3 rounded-lg bg-[#dfcec41b] border-[#cbb1a2]">
                Nữ
              </span>
            ) : (
              <span className="border py-1 px-3 rounded-lg bg-[#dfcec41b] border-[#cbb1a2]">
                Không xác định
              </span>
            )}
          </div>

          <div className="mb-4 flex items-center gap-3">
            <span className="text-lg">Ngày sinh:</span>{" "}
            {isEditing ? (
              <input
                type="date"
                name="birthday"
                value={
                  editedUser.birthday ? editedUser.birthday.slice(0, 10) : ""
                }
                onChange={handleChange}
                className="border p-2 ml-2 rounded"
              />
            ) : user.birthday ? (
              <span className="border py-1 px-3 rounded-lg bg-[#dfcec41b] border-[#cbb1a2]">
                {user.birthday.slice(0, 10)}
              </span>
            ) : (
              <span className="border py-1 px-3 rounded-lg bg-[#dfcec41b] border-[#cbb1a2]">
                Chưa cập nhật
              </span>
            )}
          </div>
        </div>

        <div className="flex gap-4 mt-6">
          <div>
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
                className="bg-primaryColor text-white px-4 py-2 rounded"
              >
                Sửa thông tin
              </button>
            )}
          </div>
          <button
            onClick={() => setIsChangingPassword(true)}
            className="bg-primaryColor text-white px-4 py-2 rounded"
          >
            Đổi mật khẩu
          </button>
        </div>
        {isChangingPassword && (
          <ChangePassword setIsChangingPassword={setIsChangingPassword} />
        )}
      </div>
    </div>
  );
}

export default Profile;
