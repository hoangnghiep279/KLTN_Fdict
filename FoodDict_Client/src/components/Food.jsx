import React, { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import { PiChefHatBold } from "react-icons/pi";
import { GiRiceCooker } from "react-icons/gi";
import { MdPeopleOutline } from "react-icons/md";
import { IoIosArrowForward } from "react-icons/io";
import { FaHeart } from "react-icons/fa";
import { toast } from "react-toastify"; // Import toast

function Food({ recipe, onChangeFavorite }) {
  const navigate = useNavigate();
  const [isFavorite, setIsFavorite] = useState(recipe.is_favorite === 1);
  const [favoriteCount, setFavoriteCount] = useState(recipe.favorite_count);

  const token = localStorage.getItem("token");

  const handleClick = () => {
    navigate(`/detailRecipe/${recipe.id}`);
  };

  const handleFavoriteClick = async () => {
    try {
      if (!token) {
        alert("Bạn cần đăng nhập để yêu thích món ăn!");
        return;
      }

      const response = await fetch(`http://localhost:3000/favorite-recipe`, {
        method: isFavorite ? "DELETE" : "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ recipeId: recipe.id }),
      });

      const data = await response.json();

      if (response.ok) {
        setIsFavorite(!isFavorite);
        setFavoriteCount((prev) => (isFavorite ? prev - 1 : prev + 1));

        if (isFavorite) {
          toast.error("Đã xóa món ăn khỏi yêu thích!");
        } else {
          toast.success("Đã thêm món ăn vào yêu thích!");
        }

        // Gọi callback nếu có
        if (onChangeFavorite) {
          onChangeFavorite();
        }
      } else {
        alert(data.message || "Đã có lỗi xảy ra!");
      }
    } catch (error) {
      console.error("Lỗi khi xử lý yêu thích:", error);
      alert("Có lỗi xảy ra khi xử lý yêu thích. Vui lòng thử lại!");
    }
  };

  const cssDesc = `flex items-center px-2 py-1 border border-[#ff8a4228] rounded-md text-sm`;

  return (
    <div className="w-[368px] relative">
      <Link to={`/detailRecipe/${recipe.id}`}>
        <div className="w-full h-[220px] overflow-hidden">
          <img
            src={`http://localhost:3000/${recipe.img_url}`}
            alt="Món ăn"
            className="w-full h-full rounded-xl object-cover"
          />
        </div>
      </Link>

      {/* Nút yêu thích */}
      <button
        onClick={handleFavoriteClick}
        className={`absolute top-3 right-3 z-10 w-12 h-12 rounded-full flex-center transition-colors duration-300 ${
          isFavorite ? "bg-red-100" : "bg-white"
        }`}
      >
        <FaHeart
          className={`text-2xl transition-colors duration-300 ${
            isFavorite ? "text-red-500" : "text-gray-600"
          }`}
        />
      </button>

      <div className="py-3">
        <p className="flex justify-between items-center">
          <Link
            to={`/detailRecipe/${recipe.id}`}
            className="first-letter:uppercase"
          >
            <span className="text-2xl font-bold">{recipe.name}</span>
          </Link>
          <span className={cssDesc}>
            {favoriteCount}
            <FaHeart className="ml-2 text-base text-red-500" />
          </span>
        </p>
        <p className="flex gap-3 items-center mt-3">
          <span className={cssDesc}>
            <MdPeopleOutline className="text-primaryColor mr-2 text-base" />
            {recipe.serving_size} người
          </span>
          <span className={cssDesc}>
            <PiChefHatBold className="text-primaryColor mr-2 text-base" />
            {!recipe.difficulty || recipe.difficulty === 1
              ? "dễ"
              : recipe.difficulty === 2
              ? "vừa"
              : "khó"}
          </span>
          <span className={cssDesc}>
            <GiRiceCooker className="text-primaryColor mr-2 text-base" />
            {recipe.cooking_time}
          </span>
        </p>
        <button
          onClick={handleClick}
          className="css_button mt-4 px-5 h-10 font-semibold"
        >
          Xem chi tiết <IoIosArrowForward className="ml-3" />
        </button>
      </div>
    </div>
  );
}

export default Food;
