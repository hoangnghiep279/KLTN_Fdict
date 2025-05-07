import axios from "axios";

const API_URL = "http://localhost:3000/favorite-recipe";

const fetchFavRecipe = async (
  setRecipes,
  token,
  setTotalPages,
  setLoading,
  page,
  limit
) => {
  try {
    const res = await axios.get(`${API_URL}?page=${page}&limit=${limit}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    setRecipes(res.data.data);
    setTotalPages(res.data.pagination.totalPages);
  } catch (err) {
    console.error("Lỗi khi lấy món ăn yêu thích:", err);
    toast.error("Không thể tải dữ liệu món ăn yêu thích. Vui lòng thử lại!");
  } finally {
    setLoading(false);
  }
};

export { fetchFavRecipe };
