import axios from "axios";

const fetchRecipesWithFavoriteStatus = async (
  setRecipes,
  setTotalPages,
  setLoading,
  page,
  limit,
  token,
  sortType = "all" // thêm tham số sortType với mặc định là 'all'
) => {
  try {
    setLoading(true);

    const response = await axios.get(
      `http://localhost:3000/recipe/recipefav?page=${page}&limit=${limit}&sortType=${sortType}`, // thêm sortType vào URL
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

const fetchRecipesforSlider = async (setRecipes, setLoading, token) => {
  try {
    const response = await axios.get(`http://localhost:3000/recipe/recipefav`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    setRecipes(response.data.data);
  } catch (error) {
    console.error("Lỗi khi lấy món ăn:", error);
  } finally {
    setLoading(false);
  }
};

export { fetchRecipesWithFavoriteStatus, fetchRecipesforSlider };
