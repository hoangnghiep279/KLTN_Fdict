import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import Input from "../components/Input";
export default function RecipeDetail() {
  const { id } = useParams();
  const [recipe, setRecipe] = useState(null);
  const [loading, setLoading] = useState(true);
  const [isOpen, setIsOpen] = useState(false);
  const [isOpenNutrition, setIsOpenNutrition] = useState(false);
  useEffect(() => {
    async function fetchRecipe() {
      try {
        const res = await axios.get(
          `http://localhost:3000/recipe/get-update/${id}`
        );
        setRecipe({
          ...res.data,
          selectedMealTypes: res.data.mealTypes
            .filter((m) => m.checked)
            .map((m) => m.id),
          selectedMealCategories: res.data.mealCategories
            .filter((c) => c.checked)
            .map((c) => c.id),
          selectedCookingMethods: res.data.cookingMethods
            .filter((c) => c.checked)
            .map((c) => c.id),
          selectedNutritionNeeds: res.data.nutritionNeeds
            .filter((n) => n.checked)
            .map((n) => n.id),
        });
      } catch (err) {
        console.error(err);
      } finally {
        setLoading(false);
      }
    }
    fetchRecipe();
  }, [id]);
  console.log(recipe);

  if (loading) return <p>Đang tải…</p>;
  if (!recipe) return <p>Không tìm thấy công thức</p>;

  return (
    <div className="w-full mt-6">
      <h2 className="text-2xl font-bold mb-4">Chi tiết Công Thức</h2>
      <div>
        <p className="font-medium text-lg">
          Tên công thức:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.name}
          </span>
        </p>

        <div className="mt-4">
          <p className="font-medium mb-2">Ảnh món ăn:</p>
          <img
            src={`http://localhost:3000/${recipe.img_url}`}
            alt="Ảnh món ăn"
            className="w-48 h-32 object-cover rounded-lg cursor-pointer transition duration-300 hover:scale-105"
            onClick={() => setIsOpen(true)}
          />

          {isOpen && (
            <div
              className="fixed inset-0 bg-black bg-opacity-80 flex items-center justify-center z-50"
              onClick={() => setIsOpen(false)}
            >
              <img
                src={`http://localhost:3000/${recipe.img_url}`}
                alt="Ảnh món ăn lớn"
                className="max-w-[90%] max-h-[90%] rounded-lg shadow-lg"
              />
            </div>
          )}
        </div>
        <p className="font-medium text-lg mt-4">
          Khẩu phần:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.serving_size}
          </span>
        </p>
        <p className="font-medium text-lg mt-4">
          Thời gian nấu (phút):
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.cooking_time}
          </span>
        </p>

        <p className="font-medium text-lg mt-4">
          Độ khó:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.difficulty === 1
              ? "dễ"
              : recipe.difficulty === 2
              ? "trung bình"
              : "khó"}
          </span>
        </p>

        <p className="font-medium text-lg mt-4">
          Calo / người:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.calories}
          </span>
        </p>
        <p className="font-medium text-lg mt-4">
          Mô tả món ăn:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.description}
          </span>
        </p>
        <p className="font-medium text-lg mt-4">
          Sơ chế:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.preparation}
          </span>
        </p>
        <p className="font-medium text-lg mt-4">
          Thực hiện:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.instructions}
          </span>
        </p>
        <p className="font-medium text-lg mt-4">
          Cách dùng:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.usagefood}
          </span>
        </p>
        <p className="font-medium text-lg mt-4">
          Mánh nhỏ:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.tips}
          </span>
        </p>
        <p className="font-medium text-lg mt-4">
          Lời khuyên từ chuyên gia:
          <span className="border px-2 py-1 ml-2 bg-[#d3a48618] text-sm rounded-lg">
            {recipe.expert_advice}
          </span>
        </p>

        <div className="mt-4">
          <p className="font-medium mb-2">Ảnh thực đơn theo dinh dưỡng:</p>
          <img
            src={`http://localhost:3000/${recipe.img_nutrition}`}
            alt="Ảnh món ăn"
            className="w-48 h-32 object-cover rounded-lg cursor-pointer transition duration-300 hover:scale-105"
            onClick={() => setIsOpenNutrition(true)}
          />

          {isOpenNutrition && (
            <div
              className="fixed inset-0 bg-black bg-opacity-80 flex items-center justify-center z-50"
              onClick={() => setIsOpenNutrition(false)}
            >
              <img
                src={`http://localhost:3000/${recipe.img_nutrition}`}
                alt="Ảnh món ăn lớn"
                className="max-w-[90%] max-h-[90%] rounded-lg shadow-lg"
              />
            </div>
          )}
        </div>

        <div className="flex flex-col gap-2 mt-6">
          <p className="text-lg font-medium">Nguyên liệu:</p>
          {recipe.ingredients.map((ing, idx) => (
            <div key={idx} className="flex items-center mt-4">
              <p>
                <span className="font-sm ml-3">Tên nguyên liệu:</span>
                <span className="w-40 px-2 mr-3 py-1 bg-[#d3a48618] text-sm border rounded-md ml-2">
                  {ing.name}
                </span>
              </p>
              ---------
              <p>
                <span className="font-sm ml-3">Loại nguyên liệu:</span>
                <span className="w-40 px-2 mr-3 py-1 bg-[#d3a48618] text-sm border rounded-md ml-2">
                  {ing.category}
                </span>
              </p>
              ---------
              <p>
                <span className="font-sm ml-3">Số lượng/khối lượng tịnh:</span>
                <span className="w-40 px-2 mr-3 py-1 bg-[#d3a48618] text-sm border rounded-md ml-2">
                  {ing.quantity}
                </span>
              </p>
              ---------
              <p>
                <span className="font-sm ml-3">Đơn vị:</span>
                <span className="w-40 px-2 mr-3 py-1 bg-[#d3a48618] text-sm border rounded-md ml-2">
                  {ing.unit}
                </span>
              </p>
            </div>
          ))}
        </div>
        <div className="flex flex-col gap-3 mt-6">
          <div>
            <p className="font-medium text-lg">Loại bữa ăn:</p>
            <div className="grid grid-cols-3 gap-4">
              {recipe.mealTypes.map((mt) => (
                <label key={mt.id} className="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    value={mt.id}
                    checked={recipe.selectedMealTypes.includes(mt.id)}
                    // onChange={(e) => handleCheckbox(e, "selectedMealTypes")}
                    className="form-checkbox h-5 w-5 text-green-600"
                  />
                  <span>{mt.name}</span>
                </label>
              ))}
            </div>
          </div>

          {/* Meal Categories */}
          <div>
            <p className="font-medium text-lg">Danh mục món ăn:</p>
            <div className="grid grid-cols-3 gap-4">
              {recipe.mealCategories.map((mc) => (
                <label key={mc.id} className="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    value={mc.id}
                    checked={recipe.selectedMealCategories.includes(mc.id)}
                    // onChange={(e) =>
                    //   handleCheckbox(e, "selectedMealCategories")
                    // }
                    className="form-checkbox h-5 w-5 text-green-600"
                  />
                  <span>{mc.name}</span>
                </label>
              ))}
            </div>
          </div>
          {/* Cooking Methods */}
          <div>
            <p className="font-medium text-lg">Phương pháp nấu:</p>
            <div className="grid grid-cols-3 gap-4">
              {recipe.cookingMethods.map((cm) => (
                <label key={cm.id} className="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    value={cm.id}
                    checked={recipe.selectedCookingMethods.includes(cm.id)}
                    // onChange={(e) => handleCheckbox(e, "selectedCookingMethods")}
                    className="form-checkbox h-5 w-5 text-green-600"
                  />
                  <span>{cm.name}</span>
                </label>
              ))}
            </div>
          </div>
          {/* Nutrition Needs */}
          <div>
            <p className="font-medium text-lg">Nhu cầu dinh dưỡng:</p>
            <div className="grid grid-cols-3 gap-4">
              {recipe.nutritionNeeds.map((nn) => (
                <label key={nn.id} className="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    value={nn.id}
                    checked={recipe.selectedNutritionNeeds.includes(nn.id)}
                    // onChange={(e) => handleCheckbox(e, "selectedNutritionNeeds")}
                    className="form-checkbox h-5 w-5 text-green-600"
                  />
                  <span>{nn.name}</span>
                </label>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
