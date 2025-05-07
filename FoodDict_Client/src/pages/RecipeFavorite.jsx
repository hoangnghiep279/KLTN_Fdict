import React, { useState, useEffect } from "react";
import Loading from "../components/Loading";
import { fetchFavRecipe } from "../api/linkrecipe/favoriteRecipe";
import Food from "../components/Food";
import Pagination from "../components/Pagination";
import { useNavigate } from "react-router-dom"; // Sửa lại hook này
import { toast } from "react-toastify";

function RecipeFavorite() {
  const [recipes, setRecipes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(1);
  const [limit, setLimit] = useState(20);
  const [totalPages, setTotalPages] = useState(1);
  const token = localStorage.getItem("token");
  const navigate = useNavigate();

  const handleReloadFavorites = () => {
    setLoading(true);
    if (token) {
      fetchFavRecipe(setRecipes, token, setTotalPages, setLoading, page, limit);
    }
  };

  useEffect(() => {
    if (!token) {
      toast("Bạn chưa đăng nhập", { type: "warning" });
      navigate("/");
    }
  }, [token, navigate]);

  useEffect(() => {
    handleReloadFavorites();
  }, [page, limit, token]);

  return (
    <div className="py-10 container mx-auto">
      <h1 className="text-center text-3xl font-bold mb-6">Món ăn yêu thích</h1>

      <div className="mt-10 flex items-center gap-8 flex-wrap">
        {loading ? (
          <Loading />
        ) : recipes.length > 0 ? (
          recipes.map((recipe) => (
            <Food
              key={recipe.id}
              recipe={recipe}
              onChangeFavorite={handleReloadFavorites} // thêm prop mới
            />
          ))
        ) : (
          <p className="text-center text-gray-500">
            Bạn chưa có món ăn yêu thích nào.
          </p>
        )}
      </div>

      <Pagination
        page={page}
        totalPages={totalPages}
        setPage={setPage}
        limit={limit}
        setLimit={setLimit}
      />
    </div>
  );
}

export default RecipeFavorite;
