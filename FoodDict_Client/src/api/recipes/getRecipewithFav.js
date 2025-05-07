import axios from "axios";

const fetchRecipesWithFavoriteStatus = async (
  setRecipes,
  setTotalPages,
  setLoading,
  page,
  limit,
  token
) => {
  try {
    const response = await axios.get(
      `http://localhost:3000/recipe/recipefav?page=${page}&limit=${limit}`,
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    setRecipes(response.data.data);
    setTotalPages(response.data.pagination.totalPages);
  } catch (error) {
    console.error("Lỗi khi lấy món ăn:", error);
  } finally {
    setLoading(false);
  }
};

export default fetchRecipesWithFavoriteStatus;
