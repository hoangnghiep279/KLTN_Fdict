import axios from "axios";

const fetchRecipes = async (
  setRecipes,
  setTotalPages,
  setLoading,
  page,
  limit,
  sortType = "all" // Thêm mặc định là 'all'
) => {
  try {
    setLoading(true); // Nên set true ở đầu luôn

    const response = await axios.get(
      `http://localhost:3000/recipe?page=${page}&limit=${limit}&sortType=${sortType}`
    );

    setRecipes(response.data.data);
    setTotalPages(response.data.pagination.totalPages);
  } catch (error) {
    console.error("Lỗi khi lấy món ăn:", error);
  } finally {
    setLoading(false);
  }
};

const fetchRecipesSlider = async (setRecipes, setLoading) => {
  try {
    const response = await axios.get(`http://localhost:3000/recipe`);

    setRecipes(response.data.data);
  } catch (error) {
    console.error("Lỗi khi lấy món ăn:", error);
  } finally {
    setLoading(false);
  }
};

export { fetchRecipes, fetchRecipesSlider };
