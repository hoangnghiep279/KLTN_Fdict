import React from "react";
import { useNavigate, Link } from "react-router-dom";
import { PiChefHatBold } from "react-icons/pi";
import { GiRiceCooker } from "react-icons/gi";
import { MdPeopleOutline } from "react-icons/md";
import { IoIosArrowForward } from "react-icons/io";
import { FaHeart } from "react-icons/fa";
function Food({ recipe }) {
  const navigate = useNavigate();
  let cssDesc = `flex  items-center px-2 py-1 border border-[#ff8a4228] rounded-md text-sm`;
  const handleClick = () => {
    navigate(`/detailRecipe/${recipe.id}`);
  };
  return (
    <div className="w-[368px] relative">
      <Link to={`/detailRecipe/${recipe.id}`}>
        <div className="w-full h-[220px] overflow-hidden">
          <img
            src={`http://localhost:3000/${recipe.img_url}`}
            alt=""
            className="w-full h-full rounded-xl object-cover"
          />
        </div>
      </Link>
      <button className="absolute top-3 right-3 z-10 w-12 h-12 bg-white rounded-full flex-center">
        <FaHeart className="text-2xl text-gray-600" />
      </button>
      <div className="py-3">
        <p className="flex justify-between items-center">
          <Link
            to={`/detailRecipe/${recipe.id}`}
            className="first-letter:uppercase"
          >
            <span className="text-2xl font-bold ">{recipe.name}</span>
          </Link>
          <span className={`${cssDesc}`}>
            {recipe.favorite_count}
            <FaHeart className="ml-2 text-base text-red-500" />
          </span>
        </p>
        <p className="flex gap-3 items-center mt-3">
          <span className={`${cssDesc}`}>
            <MdPeopleOutline className="text-primaryColor mr-2 text-base" />{" "}
            {recipe.serving_size} người
          </span>
          <span className={`${cssDesc}`}>
            {" "}
            <PiChefHatBold className="text-primaryColor mr-2 text-base" />{" "}
            {!recipe.difficulty || recipe.difficulty === 1
              ? "dễ"
              : recipe.difficulty === 2
              ? "vừa"
              : "khó"}
          </span>
          <span className={`${cssDesc}`}>
            {" "}
            <GiRiceCooker className="text-primaryColor mr-2 text-base" />{" "}
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
