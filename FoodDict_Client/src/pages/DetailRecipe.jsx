import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import {
  fdecor1,
  fdecor2,
  fdecor3,
  fdecor4,
  fdecor5,
  fdecor6,
} from "../assets/img.js";
import getRecipeById from "../api/recipes/getRecipeById.js";
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

function DetailRecipe() {
  const { id } = useParams();
  const [recipes, setRecipes] = useState([]);
  const [ingredients, setIngredients] = useState([]);
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    getRecipeById(setRecipes, setIngredients, setLoading, id);
  }, [id]);
  console.log(recipes);
  console.log(ingredients);
  //cuộn trang
  const scrollToSection = (id) => {
    const section = document.getElementById(id);
    if (section) {
      section.scrollIntoView({ behavior: "smooth" });
    }
  };
  return (
    <>
      <img src={fdecor1} alt="" className="fixed w-24 h-24 bottom-7 left-7" />
      <img src={fdecor2} alt="" className="fixed w-14 h-14 bottom-7 right-7" />
      <img src={fdecor3} alt="" className="fixed w-20 h-20 right-7" />
      <img src={fdecor4} alt="" className="fixed w-24 h-24 right-0 top-1/2" />
      <img src={fdecor5} alt="" className="fixed w-20 h-20 top-1/3" />
      <img src={fdecor6} alt="" className="fixed w-14 h-14 top-1/4 left-20" />
      <div className="container py-12 flex gap-7 ">
        <div className="w-2/3">
          <h1 className="text-3xl font-extrabold capitalize translate-x-1/4">
            {recipes.name}
          </h1>
          <div className="w-full h-[29rem] rounded-xl overflow-hidden mt-7">
            <img
              src={`http://localhost:3000/${recipes.img_url}`}
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
            <TextWithLineBreaks text={recipes.description} />
          </div>
          <div id="ingredients" className="py-7 border-y my-7">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <BsDropletFill className="text-[#ff8a42c3]" />
              Nguyên liệu:
            </h3>
            <ul className="list-disc ml-12 p-5 grid grid-cols-2 gap-3 ">
              {ingredients.map((i) => (
                <li key={i.id}>
                  {i.name} {i.quantity} {i.unit}
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
                text={recipes.preparation}
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
              <TextWithLineBreaks text={recipes.instructions} />
            </div>
          </div>
          <div id="usagefood" className="py-5">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <GiCookingPot className="text-[#ff8a42c3]" />
              Cách dùng:
            </h3>
            <div className="ml-10">
              {" "}
              <TextWithLineBreaks text={recipes.usagefood} />
            </div>
          </div>
          <div id="tips" className="py-5">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <MdTipsAndUpdates className="text-[#ff8a42c3]" />
              Mánh nhỏ:
            </h3>
            <div className="ml-10">
              {" "}
              <TextWithLineBreaks text={recipes.tips} />
            </div>
            <div className="w-full h-[29rem] overflow-hidden mt-7">
              <img
                src={`http://localhost:3000/${recipes.img_nutrition}`}
                alt=""
                className="w-full h-full object-contain"
              />
            </div>
          </div>
          <div id="expert_advice" className="py-5">
            <h3 className="flex gap-3 items-center text-2xl font-extrabold">
              <SiGoogledocs className="text-[#ff8a42c3]" />
              Lời Khuyên của chuyên gia dinh dưỡng:
            </h3>
            <div className="ml-10">
              {" "}
              <TextWithLineBreaks
                text={recipes.expert_advice}
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
                  {recipes.serving_size} người
                </span>
              </p>
              <p className="flex flex-col items-center">
                <IoMdTimer className="text-[#ff8a42c3] text-xl" />
                <span className="text-xs">Thời gian thực hiện:</span>
                <span className="font-semibold text-sm">
                  {recipes.cooking_time}
                </span>
              </p>
              <p className="flex flex-col items-center">
                <SiCodechef className="text-[#ff8a42c3] text-xl" />
                <span className="text-xs">Độ khó:</span>
                <span className="font-semibold text-sm">
                  {recipes.difficulty === 1
                    ? "Dễ"
                    : recipes.difficulty === 2
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
                {recipes.calories} kcal/người
              </span>
            </p>
          </div>
          <button className="white-shadow w-full py-3 rounded-lg mt-10 font-bold border-none outline-none text-gray-500  flex-center">
            <FaHeart className="text-xl mr-3" /> Lưu công thức
          </button>
          <button className="css_button w-full py-3 rounded-lg mt-12 font-bold animate-bounce">
            Xem các công thức gợi ý khác
            <MdKeyboardDoubleArrowDown className="text-xl " />
          </button>
        </div>
      </div>
    </>
  );
}

export default DetailRecipe;
