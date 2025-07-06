import React, { useEffect, useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import Pagination from "../components/Pagination";
function RecipeManager() {
  const [recipes, setRecipes] = useState([]);
  const [totalPages, setTotalPages] = useState(1);
  const [page, setPage] = useState(1);
  const [limit, setLimit] = useState(10);
  const [searchInput, setSearchInput] = useState("");
  const [searchQuery, setSearchQuery] = useState("");
  const [loading, setLoading] = useState(false);

  const token = localStorage.getItem("token");

  const fetchRecipes = async () => {
    try {
      setLoading(true);
      const response = await axios.get(
        "http://localhost:3000/recipe/user-recipe",
        {
          params: { page, limit: 10, search: searchQuery },
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
      setRecipes(response.data.data);
      setTotalPages(response.data.pagination.totalPages);
    } catch (error) {
      console.error("Lỗi khi lấy danh sách công thức:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchRecipes();
  }, [page, searchQuery]);

  const handleSearch = () => {
    setPage(1); // reset về page 1 khi tìm
    setSearchQuery(searchInput.trim());
  };

  const handleEnterSearch = (e) => {
    if (e.key === "Enter") {
      handleSearch();
    }
  };

  return (
    <div className="container mx-auto p-4">
      <h3 className="text-2xl font-bold mb-4">Công thức của bạn</h3>
      <Link to={"/add-recipe"} className="css_button w-44 h-10 block mb-4">
        Thêm công thức
      </Link>
      {loading ? (
        <p>Đang tải...</p>
      ) : recipes.length === 0 ? (
        <div className="text-gray-600 py-4">
          <span className="my-3 block">Bạn chưa có công thức nào.</span>
        </div>
      ) : (
        <>
          {/* Tìm kiếm */}
          <div className="mb-4 flex gap-2">
            <input
              type="text"
              placeholder="Tìm công thức..."
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              onKeyDown={handleEnterSearch}
              className="border border-gray-300 rounded px-3 py-1"
            />
            <button
              onClick={handleSearch}
              className="bg-blue-500 text-white px-4 py-1 rounded hover:bg-blue-600"
            >
              Tìm kiếm
            </button>
          </div>

          {/* Bảng công thức */}
          <table className="min-w-full table-auto border border-gray-300 text-sm">
            <thead>
              <tr className="bg-gray-100">
                <th className="border px-4 py-2 text-left">Tên món</th>
                <th className="border px-4 py-2 text-left">Ảnh</th>
                <th className="border px-4 py-2 text-left">Khẩu phần</th>
                <th className="border px-4 py-2 text-left">Thời gian</th>
                <th className="border px-4 py-2 text-left">Độ khó</th>
                <th className="border px-4 py-2 text-left">Lượt yêu thích</th>
                <th className="border px-4 py-2 text-left">Trạng thái</th>
                <th className="border px-4 py-2 text-left">Hành động</th>
              </tr>
            </thead>
            <tbody>
              {recipes.map((recipe) => (
                <tr key={recipe.id}>
                  <td className="border px-4 py-2">
                    <Link to={`/detailRecipe/${recipe.id}`}>{recipe.name}</Link>
                  </td>
                  <td className="border px-4 py-2">
                    <Link to={`/detailRecipe/${recipe.id}`}>
                      <img
                        src={`http://localhost:3000/${recipe.img_url}`}
                        alt={recipe.name}
                        className="h-12 w-12 object-cover rounded"
                      />
                    </Link>
                  </td>
                  <td className="border px-4 py-2">{recipe.serving_size}</td>
                  <td className="border px-4 py-2">{recipe.cooking_time}</td>
                  <td className="border px-4 py-2">{recipe.difficulty}</td>
                  <td className="border px-4 py-2">{recipe.favorite_count}</td>
                  <td className="border px-4 py-2">
                    {recipe.status === 0 && (
                      <span className="text-yellow-500">Chờ duyệt</span>
                    )}
                    {recipe.status === 1 && (
                      <span className="text-green-600">Đã duyệt</span>
                    )}
                    {recipe.status === 2 && (
                      <span className="text-red-500">Bị từ chối</span>
                    )}
                  </td>
                  <td className="border px-4 py-2">
                    {(recipe.status === 0 || recipe.status === 2) && (
                      <>
                        <Link
                          className="text-blue-600 hover:underline mr-2"
                          to={`updaterecipe/${recipe.id}`}
                        >
                          Sửa
                        </Link>
                        <button
                          onClick={() => handleDelete(recipe.id)}
                          className="text-red-600 hover:underline"
                        >
                          Xóa
                        </button>
                      </>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>

          <Pagination
            page={page}
            totalPages={totalPages}
            setPage={setPage}
            limit={limit}
            setLimit={setLimit}
          />
        </>
      )}
    </div>
  );
}

export default RecipeManager;
