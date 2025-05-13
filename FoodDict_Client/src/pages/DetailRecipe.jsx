import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { toast } from "react-toastify";
import {
  getRecipeById,
  getRecipeByIdForUser,
} from "../api/recipes/getRecipeById.js";
import TextWithLineBreaks from "../components/TextWithLineBreaks.jsx";
import { BsDropletFill } from "react-icons/bs";
import { GiCurvyKnife, GiCookingPot } from "react-icons/gi";
import { PiForkKnifeFill } from "react-icons/pi";
import { MdTipsAndUpdates } from "react-icons/md";
import { SiGoogledocs } from "react-icons/si";
import { IoPeople } from "react-icons/io5";
import { IoMdTimer } from "react-icons/io";
import { FaHeart } from "react-icons/fa";
import { SiCodechef } from "react-icons/si";
import { MdKeyboardDoubleArrowDown } from "react-icons/md";
import Slider from "../components/Slider.jsx";
import { fetchRecipesforSlider } from "../api/recipes/getRecipewithFav.js";
import { fetchRecipesSlider } from "../api/recipes/getRecipe.js";
import CommentSection from "../components/CommentSection.jsx";
function DetailRecipe() {
  const { id } = useParams();
  const [recipes, setRecipes] = useState([]);
  const [isFavorite, setIsFavorite] = useState(false);
  const [recipesDetail, setRecipesDetail] = useState([]);
  const [ingredients, setIngredients] = useState([]);
  const [loading, setLoading] = useState(true);
  const token = localStorage.getItem("token");
  useEffect(() => {
    if (token) {
      getRecipeByIdForUser(
        setRecipesDetail,
        setIngredients,
        setLoading,
        id,
        token
      );
    } else {
      getRecipeById(setRecipesDetail, setIngredients, setLoading, id);
    }
  }, [id, token]);
  console.log(recipesDetail);

  useEffect(() => {
    if (token) {
      fetchRecipesforSlider(setRecipes, setLoading, token);
    } else {
      fetchRecipesSlider(setRecipes, setLoading);
    }
  }, [token]);

  //cuộn trang
  const scrollToSection = (id) => {
    const section = document.getElementById(id);
    if (section) {
      const yOffset = -120; // nếu header cao 120px
      const y =
        section.getBoundingClientRect().top + window.pageYOffset + yOffset;
      window.scrollTo({ top: y, behavior: "smooth" });
    }
  };

  const handleFavoriteClick = async () => {
    try {
      if (!token) {
        alert("Bạn cần đăng nhập để yêu thích món ăn!");
        return;
      }
      const isFavorite = recipesDetail.isFavorite;
      const response = await fetch(`http://localhost:3000/favorite-recipe`, {
        method: isFavorite ? "DELETE" : "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({ recipeId: recipesDetail.id }),
      });

      const data = await response.json();

      if (response.ok) {
        setIsFavorite(!isFavorite);

        if (isFavorite) {
          toast.error("Đã xóa món ăn khỏi yêu thích!");
        } else {
          toast.success("Đã thêm món ăn vào yêu thích!");
        }
        getRecipeByIdForUser(
          setRecipesDetail,
          setIngredients,
          setLoading,
          id,
          token
        );
      } else {
        alert(data.message || "Đã có lỗi xảy ra!");
      }
    } catch (error) {
      console.error("Lỗi khi xử lý yêu thích:", error);
      alert("Có lỗi xảy ra khi xử lý yêu thích. Vui lòng thử lại!");
    }
  };
  return (
    <>
      <div className="container py-20 flex gap-7 ">
        <div className="w-2/3">
          <h1 className="text-3xl font-extrabold capitalize translate-x-1/4">
            {recipesDetail.name}
          </h1>
          <div className="w-full h-[29rem] rounded-xl overflow-hidden mt-7">
            <img
              src={`http://localhost:3000/${recipesDetail.img_url}`}
              alt=""
              className="w-full h-full object-cover"
            />
          </div>
          <div className="flex items-center gap-3 mt-7">
            <button
              className="flex-center border py-2 px-4 rounded-md hover:bg-primaryColor hover:text-white border-primaryColor"
              onClick={() => scrollToSection("desc")}
            >
              Mô tả
            </button>
            <button
              className="flex-center border py-2 px-4 rounded-md hover:bg-primaryColor hover:text-white border-primaryColor"
              onClick={() => scrollToSection("ingredients")}
            >
              Nguyên liệu
            </button>
            <button
              className="flex-center border py-2 px-4 rounded-md hover:bg-primaryColor hover:text-white border-primaryColor"
              onClick={() => scrollToSection("preparation")}
            >
              Sơ chế
            </button>
            <button
              className="flex-center border py-2 px-4 rounded-md hover:bg-primaryColor hover:text-white border-primaryColor"
              onClick={() => scrollToSection("instructions")}
            >
              Thực hiện
            </button>
            <button
              className="flex-center border py-2 px-4 rounded-md hover:bg-primaryColor hover:text-white border-primaryColor"
              onClick={() => scrollToSection("usagefood")}
            >
              Cách dùng
            </button>
            <button
              className="flex-center border py-2 px-4 rounded-md hover:bg-primaryColor hover:text-white border-primaryColor"
              onClick={() => scrollToSection("tips")}
            >
              Mánh nhỏ
            </button>
          </div>
          <div id="desc" className="mt-8">
            {" "}
            <TextWithLineBreaks text={recipesDetail.description} />
          </div>
          <div id="ingredients" className="py-7 border-y my-7">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <BsDropletFill className="text-[#ff8a42c3]" />
              Nguyên liệu:
            </h3>
            <p className="ml-10 my-5">M: muỗng canh - m: muỗng cafe</p>
            <ul className="list-disc ml-12 p-5 grid grid-cols-2 gap-3 ">
              {ingredients.map((i) => (
                <li key={i.id}>
                  {i.name} {i.quantity}
                  {i.unit}
                </li>
              ))}
            </ul>
          </div>
          <div id="preparation" className="py-5">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <GiCurvyKnife className="text-[#ff8a42c3]" />
              Sơ chế:
            </h3>
            <div className="ml-10">
              {" "}
              <TextWithLineBreaks
                text={recipesDetail.preparation}
                styleCss="list-disc"
              />
            </div>
          </div>
          <div id="instructions" className="py-5">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <PiForkKnifeFill className="text-[#ff8a42c3]" />
              Thực hiện:
            </h3>
            <div className="ml-10">
              {" "}
              <TextWithLineBreaks text={recipesDetail.instructions} />
            </div>
          </div>
          <div id="usagefood" className="py-5">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <GiCookingPot className="text-[#ff8a42c3]" />
              Cách dùng:
            </h3>
            <div className="ml-10">
              {" "}
              <TextWithLineBreaks text={recipesDetail.usagefood} />
            </div>
          </div>
          <div id="tips" className="py-5">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <MdTipsAndUpdates className="text-[#ff8a42c3]" />
              Mánh nhỏ:
            </h3>
            <div className="ml-10">
              {" "}
              <TextWithLineBreaks text={recipesDetail.tips} />
            </div>
            {recipesDetail.img_nutrition && (
              <div className="w-full h-[29rem] overflow-hidden mt-7">
                <img
                  src={`http://localhost:3000/${recipesDetail.img_nutrition}`}
                  alt=""
                  className="w-full h-full object-contain"
                />
              </div>
            )}
          </div>
          <div id="expert_advice" className="py-5">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <SiGoogledocs className="text-[#ff8a42c3]" />
              Lời Khuyên của chuyên gia dinh dưỡng:
            </h3>
            <div className="ml-10">
              {" "}
              <TextWithLineBreaks
                text={recipesDetail.expert_advice}
                styleCss="list-disc"
              />
            </div>
          </div>
        </div>
        <div className="w-1/3 sticky top-36 self-start">
          <div className="border p-5 rounded-lg border-primaryColor w-full">
            <div className="flex items-center justify-between">
              <p className="flex flex-col items-center">
                <IoPeople className="text-[#ff8a42c3] text-xl" />
                <span className="text-xs">Khẩu phần:</span>
                <span className="font-semibold text-sm">
                  {recipesDetail.serving_size} người
                </span>
              </p>
              <p className="flex flex-col items-center">
                <IoMdTimer className="text-[#ff8a42c3] text-xl" />
                <span className="text-xs">Thời gian thực hiện:</span>
                <span className="font-semibold text-sm">
                  {recipesDetail.cooking_time}
                </span>
              </p>
              <p className="flex flex-col items-center">
                <SiCodechef className="text-[#ff8a42c3] text-xl" />
                <span className="text-xs">Độ khó:</span>
                <span className="font-semibold text-sm">
                  {recipesDetail.difficulty === 1
                    ? "Dễ"
                    : recipesDetail.difficulty === 2
                    ? "Trung bình"
                    : "Khó"}
                </span>
              </p>
            </div>
            <h3 className="uppercase text-gray-400 text-xs text-center my-4">
              Thông tin dinh dưỡng
            </h3>
            <p className="flex items-center justify-between">
              <span>Dinh dưỡng:</span>
              <span className="font-semibold text-sm">
                {recipesDetail.calories} kcal/người
              </span>
            </p>
          </div>
          <button
            onClick={handleFavoriteClick}
            className={`white-shadow w-full py-3 rounded-lg mt-10 font-bold outline-none text-gray-500  flex-center 
               ${
                 recipesDetail.isFavorite
                   ? "border border-red-400 text-red-500"
                   : "border-none"
               }`}
          >
            <FaHeart className="text-xl mr-3" /> Lưu công thức
          </button>
          <button
            className="css_button w-full py-3 rounded-lg mt-12 font-bold animate-bounce"
            onClick={() => scrollToSection("difficult-recipe")}
          >
            Xem các công thức gợi ý khác
            <MdKeyboardDoubleArrowDown className="text-xl " />
          </button>
        </div>
      </div>
      <div className="container">
        <CommentSection recipeId={recipesDetail.id} userToken={token} />
      </div>
      <div className="my-10"></div>
      <div id="difficult-recipe" className="bg-colorBlur py-10">
        <h3 className="font-extrabold  py-2 mb-10 uppercase text-3xl text-center">
          <span className="text-red-500"> Công thức</span> bạn có thể thích
        </h3>
        <Slider recipes={recipes} />
      </div>{" "}
    </>
  );
}

export default DetailRecipe;
