import React, { useEffect, useState } from "react";
import { getRecipesByMealTypes } from "../api/linkrecipe/mealtype";
import Food from "../components/Food";
function MealType() {
  const [data, setData] = useState([]);
  const [selectedType, setSelectedType] = useState(null);

  useEffect(() => {
    async function fetchData() {
      const response = await getRecipesByMealTypes();
      if (response.code === 200) {
        setData(response.data);
        setSelectedType(response.data[0]?.id); // chọn loại đầu tiên mặc định
      }
    }

    fetchData();
  }, []);

  const handleSelect = (id) => {
    setSelectedType(id);
  };

  const selectedMeal = data.find((meal) => meal.id === selectedType);

  return (
    <div className="container mx-auto py-10">
      <h1 className="text-3xl font-bold mb-6">Danh mục theo loại món ăn</h1>

      {/* Navbar meal type */}
      <div className="flex flex-wrap gap-4 mb-8">
        {data.map((meal) => (
          <button
            key={meal.id}
            onClick={() => handleSelect(meal.id)}
            className={`px-4 py-2 rounded-full border ${
              meal.id === selectedType
                ? "bg-primaryColor text-white"
                : "bg-white text-gray-700 hover:bg-gray-100"
            }`}
          >
            {meal.name}
          </button>
        ))}
      </div>

      {/* Recipes list */}
      {selectedMeal ? (
        selectedMeal.recipes.length === 0 ? (
          <p className="text-gray-500 italic">Không có món ăn.</p>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {selectedMeal.recipes.map((recipe) => (
              <Food key={recipe.id} recipe={recipe} />
            ))}
          </div>
        )
      ) : (
        <p className="text-gray-500">Đang tải...</p>
      )}
    </div>
  );
}

export default MealType;
