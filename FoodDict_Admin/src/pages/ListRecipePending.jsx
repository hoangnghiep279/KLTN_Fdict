import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import getPendingRecipes from "../api/recipes/getPendingRecipes";
import updateRecipeStatus from "../api/recipes/updateRecipeStatus";
import { toast } from "react-toastify";
import Pagination from "../components/Pagination";

function ListRecipePending() {
  const [recipes, setRecipes] = useState([]);
  const [page, setPage] = useState(1);
  const [limit, setLimit] = useState(10);
  const [totalPages, setTotalPages] = useState(1);
  const [search, setSearch] = useState("");

  const fetchData = async () => {
    try {
      const res = await getPendingRecipes(page, 10, search);
      setRecipes(res.data);
      setTotalPages(res.pagination.totalPages);
    } catch (err) {
      console.error("Lỗi khi load công thức chờ duyệt:", err);
    }
  };

  useEffect(() => {
    fetchData();
  }, [page]);

  const handleApprove = async (id) => {
    await updateRecipeStatus(id, 1); // Duyệt
    fetchData();
  };

  const handleReject = async (id) => {
    await updateRecipeStatus(id, 2); // Từ chối
    fetchData();
  };

  return (
    <div className="p-4">
      <h2 className="text-xl font-bold mb-4">Công thức chờ duyệt</h2>

      {recipes.length > 0 ? (
        <div className="overflow-y-auto min-h-[450px]">
          <table className="w-[85%] border-collapse">
            <thead className="bg-gray-100 sticky top-0 z-10">
              <tr>
                <th className="px-4 py-3 text-left w-2/6">Tên món ăn</th>
                <th className="px-4 py-3 w-1/6">Ảnh</th>
                <th className="px-4 py-3 w-1/6">Chi tiết</th>
                <th className="px-4 py-3 w-1/6">Duyệt</th>
                <th className="px-4 py-3 w-1/6">Từ chối</th>
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
                      to={`recipedetail/${recipe.id}`}
                      relative="path"
                      className="text-green-600 hover:underline"
                    >
                      Xem chi tiết
                    </Link>
                  </td>
                  <td className="px-4 border h-16 text-center">
                    <button
                      onClick={() => handleApprove(recipe.id)}
                      className="text-blue-600 hover:underline"
                    >
                      Duyệt
                    </button>
                  </td>
                  <td className="px-4 border h-16 text-center">
                    <button
                      onClick={() => handleReject(recipe.id)}
                      className="text-red-600 hover:underline"
                    >
                      Từ chối
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>

          {/* Phân trang */}
          <Pagination
            page={page}
            totalPages={totalPages}
            setPage={setPage}
            limit={limit}
            setLimit={setLimit}
          />
        </div>
      ) : (
        <p>Không có công thức chờ duyệt nào.</p>
      )}
    </div>
  );
}

export default ListRecipePending;
