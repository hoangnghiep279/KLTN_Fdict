import React, { useState, useEffect } from "react";
import { Link, useParams } from "react-router-dom";
import Loading from "../components/Loading";
import fetchRecipes from "../api/recipes/getRecipes";
import deleteRecipe from "../api/recipes/deleteRecipe";
function Home() {
  const id = useParams();
  const [recipes, setRecipes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(1);
  const [limit, setLimit] = useState(20);
  const [totalPages, setTotalPages] = useState(1);
  console.log(recipes);
  useEffect(() => {
    fetchRecipes(setRecipes, setTotalPages, setLoading, page, limit);
  }, [page]);
  const handleDelete = (id) => {
    deleteRecipe(id, (deletedId) => {
      setRecipes((prev) => prev.filter((recipe) => recipe.id !== deletedId));
    });
  };
  if (loading) return <Loading />;
  return (
    <div className="bg-[#F9FAFF] h-screen">
      <h3>Danh sách công thức</h3>
      {recipes.length > 0 ? (
        <div className="overflow-y-auto min-h-[450px]">
          <table className="w-[85%] border-collapse">
            <thead className="bg-gray-100 sticky top-0 z-10">
              <tr>
                <th className="px-4 py-3 text-left w-2/5">Tên món ăn</th>
                <th className="px-4 py-3 w-1/5">Ảnh</th>
                <th className="px-4 py-3 w-1/5">Chi tiết</th>
                <th className="px-4 py-3 w-1/5">Sửa công thức</th>
                <th className="px-4 py-3 w-1/5">Xóa công thức</th>
              </tr>
            </thead>
            <tbody>
              {recipes.map((recipe) => (
                <tr
                  key={recipe.id}
                  className="hover:bg-gray-50 even:bg-gray-50"
                >
                  <td
                    className="px-4 py-3 border h-16 max-w-xs truncate"
                    title={recipe.name}
                  >
                    <span className="font-medium">{recipe.name}</span>
                  </td>
                  <td className="px-4 border h-16 text-center">
                    <div className="flex justify-center items-center h-full">
                      <img
                        src={`http://localhost:3000/${recipe.img_url}`}
                        alt={recipe.name}
                        className="max-h-12 max-w-[100px] object-contain"
                      />
                    </div>
                  </td>

                  <td className="px-4 border h-16 text-center">
                    <Link
                      className="text-green-600 hover:text-green-800 hover:underline transition-colors"
                      to={`recipedetail/${recipe.id}`}
                    >
                      Xem chi tiết
                    </Link>
                  </td>
                  <td className="px-4 border h-16 text-center">
                    <Link
                      className="text-green-600 hover:text-green-800 hover:underline transition-colors"
                      to={`updaterecipe/${recipe.id}`}
                    >
                      Sửa
                    </Link>
                  </td>
                  <td className="px-4 border h-16 text-center">
                    <button
                      onClick={() => handleDelete(recipe.id)}
                      className="text-red-600 hover:text-red-800 hover:underline transition-colors"
                    >
                      Xóa
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p>Chưa có công thức</p>
      )}
    </div>
  );
}

export default Home;
