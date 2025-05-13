import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import RecipeCard from "../components/RecipeCard";
import RecipeCardTwo from "../components/RecipeCardTwo";
import { IoIosSearch } from "react-icons/io";
import { toast } from "react-toastify";
import {
  fetchMealPlans,
  fetchSuggestedRecipes,
  searchRecipes,
  deleteMealPlan,
} from "../api/mealPlanAPI";

function MealPlanner() {
  const token = localStorage.getItem("token");
  const navigate = useNavigate();
  const [suggestedRecipes, setSuggestedRecipes] = useState([]);
  const [mealPlans, setMealPlans] = useState([]);
  const [searchKeyword, setSearchKeyword] = useState("");
  const [isSearching, setIsSearching] = useState(false);

  // lấy các thực đơn và gợi ý
  useEffect(() => {
    if (!token) {
      toast("Bạn chưa đăng nhập", { type: "warning" });
      navigate("/");
    } else {
      loadMealPlans();
      loadSuggestedRecipes();
    }
  }, [token, navigate]);

  // xóa món ăn trong thực đơn
  const handleDeleteMeal = async (mealPlanId) => {
    const confirmDelete = window.confirm(
      "Bạn có chắc muốn xóa món ăn này không?"
    );
    if (!confirmDelete) return;
    try {
      await deleteMealPlan(mealPlanId, token);
      // Sau khi xóa, gọi lại danh sách
      loadMealPlans();
    } catch (error) {
      // lỗi đã được toast trong API
    }
  };
  // lấy các thực đơn
  const loadMealPlans = async () => {
    try {
      const rawData = await fetchMealPlans(token);

      const filledMealPlans = Array.from({ length: 7 }, (_, index) => ({
        id: index + 1,
        breakfast: null,
        lunch: null,
        dinner: null,
      }));

      rawData.forEach((item) => {
        const index = item.menu_number - 1;
        if (index >= 0 && index < 7) {
          const recipeComponent = (
            <RecipeCard
              name={item.recipe_name}
              image={item.recipe_img}
              onDelete={() => handleDeleteMeal(item.id)}
            />
          );

          if (item.meal_time === 1)
            filledMealPlans[index].breakfast = recipeComponent;
          if (item.meal_time === 2)
            filledMealPlans[index].lunch = recipeComponent;
          if (item.meal_time === 3)
            filledMealPlans[index].dinner = recipeComponent;
        }
      });

      setMealPlans(filledMealPlans);
    } catch (error) {
      // Lỗi đã được xử lý bên trong mealPlanApi
    }
  };

  // lấy công thức gợi ý
  const loadSuggestedRecipes = async () => {
    try {
      const recipes = await fetchSuggestedRecipes();
      setSuggestedRecipes(recipes);
    } catch (error) {
      console.log("lỗi");
    }
  };
  const handleSearch = async () => {
    if (searchKeyword.trim() === "") {
      setIsSearching(false);
      loadSuggestedRecipes();
      return;
    }

    try {
      const results = await searchRecipes(searchKeyword);
      const formattedResults = results.map((item) => ({
        id: item.id,
        name: item.name,
        img_url: item.img_url,
        serving_size: item.serving_size,
        cooking_time: item.cooking_time,
        difficulty: item.difficulty,
      }));
      setSuggestedRecipes(formattedResults);
      console.log(formattedResults);
      setIsSearching(true);
    } catch (error) {
      // đã xử lý toast trong API
    }
  };
  return (
    <>
      <h3 className="text-3xl font-bold text-center pt-10">
        Kế hoạch <span className="text-red-500">nấu ăn</span>
      </h3>
      <div className="container flex gap-8 py-10">
        {/* Bảng thực đơn */}
        <div className="shadow-xl w-[60%] py-8 rounded-xl">
          <div className="max-h-[500px] overflow-y-auto custom-scrollbar">
            <table className="w-full">
              <thead>
                <tr className="grid grid-cols-4 gap-3 text-center">
                  <td></td>
                  <td className="font-bold text-primaryColor text-xl">Sáng</td>
                  <td className="font-bold text-primaryColor text-xl">Trưa</td>
                  <td className="font-bold text-primaryColor text-xl">Tối</td>
                </tr>
              </thead>
              <tbody className="flex flex-col gap-3 p-3">
                {mealPlans.map((meal, index) => (
                  <tr
                    key={index}
                    className="grid grid-cols-4 gap-3 bg-colorBlur rounded-lg p-3 border-primaryColor border"
                  >
                    <td className="flex-center">
                      <span className="py-2 px-3 bg-[#f4451e2c] border border-primaryColor rounded-xl">
                        Thực đơn: <span className="font-bold">{meal.id}</span>
                      </span>
                    </td>
                    <td>{meal.breakfast || null}</td>
                    <td>{meal.lunch || null}</td>
                    <td>{meal.dinner || null}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        {/* Sidebar phải */}
        <div className="w-[40%] shadow-xl pb-8 rounded-xl px-4 max-h-[600px] overflow-y-auto custom-scrollbar">
          <div className="sticky top-0 z-10 bg-white pb-4">
            <div className="flex items-center hover:border-primaryColor border px-3 h-11 bg-[#66666611] w-full rounded-md">
              <button onClick={handleSearch}>
                <IoIosSearch className="text-2xl" />
              </button>
              <input
                id="search"
                type="text"
                placeholder="Tìm kiếm"
                className="ml-2 default-input w-full"
                value={searchKeyword}
                onChange={(e) => setSearchKeyword(e.target.value)}
                onKeyDown={(e) => {
                  if (e.key === "Enter") handleSearch();
                }}
              />
            </div>
          </div>
          <div className="flex flex-col gap-3">
            {suggestedRecipes.map((recipe) => (
              <RecipeCardTwo
                key={recipe.id}
                recipe={recipe}
                onAddSuccess={loadMealPlans}
              />
            ))}
          </div>
        </div>
      </div>
    </>
  );
}

export default MealPlanner;
