import React, { useState } from "react";
import { FaPlusCircle } from "react-icons/fa";
import { PiChefHatBold } from "react-icons/pi";
import { GiRiceCooker } from "react-icons/gi";
import { MdPeopleOutline } from "react-icons/md";
import { addMealPlan } from "../api/mealPlanAPI"; // bạn sẽ tạo cái này bên dưới

function RecipeCardTwo({ recipe, onAddSuccess }) {
  const [showOptions, setShowOptions] = useState(false);
  const [selectedMealTime, setSelectedMealTime] = useState(null);
  const [selectedMenu, setSelectedMenu] = useState(1);
  const token = localStorage.getItem("token");

  const handleAdd = async () => {
    try {
      const body = [
        {
          recipeId: recipe.id,
          menuNumber: selectedMenu, // thực đơn 1–7
          mealTime: selectedMealTime, // 1=sáng, 2=trưa, 3=tối
        },
      ];
      await addMealPlan(token, body);
      setShowOptions(false);
      if (onAddSuccess) onAddSuccess(); // reload meal plans
    } catch (err) {
      console.error("Lỗi khi thêm:", err);
    }
  };

  return (
    <div className="border border-gray-300 hover:border-primaryColor rounded-lg py-5 px-3 bg-[#FAFAFA] relative">
      <button
        onClick={() => setShowOptions(!showOptions)}
        className="absolute shadow-lg w-9 h-9 rounded-full bg-white flex-center right-[-10px] top-[-10px]"
      >
        <FaPlusCircle className="text-2xl text-green-500" />
      </button>

      {showOptions && (
        <div className="absolute z-50 top-10 right-0 bg-white shadow-xl rounded-md p-3 w-56 border">
          <p className="font-semibold mb-2">Chọn buổi ăn:</p>
          <div className="flex gap-2 mb-2">
            {["Sáng", "Trưa", "Tối"].map((label, i) => (
              <button
                key={label}
                onClick={() => setSelectedMealTime(i + 1)}
                className={`px-3 py-1 rounded border ${
                  selectedMealTime === i + 1
                    ? "bg-green-500 text-white"
                    : "bg-gray-100"
                }`}
              >
                {label}
              </button>
            ))}
          </div>
          <p className="font-semibold mb-2">Chọn số thực đơn:</p>
          <div className="grid grid-cols-7 gap-1 mb-3">
            {[...Array(7)].map((_, i) => (
              <button
                key={i}
                onClick={() => setSelectedMenu(i + 1)}
                className={`text-sm px-2 py-1 border rounded ${
                  selectedMenu === i + 1
                    ? "bg-primaryColor text-white"
                    : "bg-gray-100"
                }`}
              >
                {i + 1}
              </button>
            ))}
          </div>
          <button
            onClick={handleAdd}
            className="w-full bg-green-500 text-white py-1 rounded font-semibold hover:bg-green-600"
            disabled={!selectedMealTime}
          >
            Thêm vào thực đơn
          </button>
        </div>
      )}

      <div className="flex gap-5 items-center">
        <div className="w-32 h-16 rounded-lg overflow-hidden">
          <img src={`http://localhost:3000/${recipe.img_url}`} alt="" />
        </div>
        <div>
          <p className="font-bold text-lg mb-3">{recipe.name}</p>
          <div className="flex flex-wrap items-center gap-3">
            <span className="flex items-center px-2 py-1 border border-[#ff8a4228] rounded-md text-sm">
              <MdPeopleOutline className="text-primaryColor mr-2 text-base" />
              {recipe.serving_size}
            </span>
            <span className="flex items-center px-2 py-1 border border-[#ff8a4228] rounded-md text-sm">
              <PiChefHatBold className="text-primaryColor mr-2 text-base" />
              {recipe.difficulty === 1
                ? "Dễ"
                : recipe.difficulty === 2
                ? "Vừa"
                : "Khó"}
            </span>
            <span className="flex items-center px-2 py-1 border border-[#ff8a4228] rounded-md text-sm">
              <GiRiceCooker className="text-primaryColor mr-2 text-base" />
              {recipe.cooking_time}
            </span>
          </div>
        </div>
      </div>
    </div>
  );
}

export default RecipeCardTwo;
