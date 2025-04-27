import axios from "axios";

async function updateProfileUser(data) {
  const token = localStorage.getItem("token"); // hoặc nơi bạn lưu token
  const response = await axios.put(
    "http://localhost:3000/api/users/profile",
    data,
    {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    }
  );
  return response.data;
}

export default updateProfileUser;
