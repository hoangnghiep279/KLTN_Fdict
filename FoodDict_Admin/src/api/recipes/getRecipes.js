import axios from "axios";

const fetchRecipes = async (
  setRecipes,
  setTotalPages,
  setLoading,
  page,
  limit,
  search = ""
) => {
  try {
    setLoading(true);
    const response = await axios.get("http://localhost:3000/recipe", {
      params: {
        page,
        limit,
        search,
      },
    });
    setRecipes(response.data.data);
    setTotalPages(response.data.pagination.totalPages);
  } catch (error) {
    console.error("Lỗi khi lấy danh sách công thức:", error);
  } finally {
    setLoading(false);
  }
};

export default fetchRecipes;
