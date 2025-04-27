import React, { useEffect, useState } from "react";
import { fetchCookMethod } from "../api/linkrecipe/cookMethod";
import { fetchIngredient } from "../api/linkrecipe/ingredient";
import { fetchMealType } from "../api/linkrecipe/mealtype";
import { fetchNutrition } from "../api/linkrecipe/nutrition";
import { fetchMealOfDay } from "../api/linkrecipe/mealOfDay";

const capitalize = (s) => s.charAt(0).toUpperCase() + s.slice(1).toLowerCase();

const ingredientWhitelist = {
  "rau củ quả": ["Cà chua", "Cải bẹ xanh ", "Ớt xiêm xanh"],
};

const FilterPanel = ({ onFilterChange }) => {
  const [cookMethods, setCookMethods] = useState([]);
  const [ingredients, setIngredients] = useState([]);
  const [mealTypes, setMealTypes] = useState([]);
  const [nutritions, setNutritions] = useState([]);
  const [mealOfDay, setMealOfDay] = useState([]);

  const [activeSection, setActiveSection] = useState(null);

  const [selectedFilters, setSelectedFilters] = useState({
    dinh_duong: [],
    nguyen_lieu: [],
    cach_nau: [],
    loai_bua_an: [],
    danh_muc_mon_an: [],
  });
  useEffect(() => {
    const fetchAllFilters = async () => {
      try {
        const [cMethods, ingr, meals, nutrs, mealofday] = await Promise.all([
          fetchCookMethod(),
          fetchIngredient(),
          fetchMealType(),
          fetchNutrition(),
          fetchMealOfDay(),
        ]);
        setCookMethods(cMethods);
        setIngredients(ingr);
        setMealTypes(meals);
        setNutritions(nutrs);
        setMealOfDay(mealofday);
      } catch (err) {
        console.error("Lỗi khi load filter:", err);
      }
    };

    fetchAllFilters();
  }, []);

  const handleChange = (type, id) => {
    setSelectedFilters((prev) => {
      const current = new Set(prev[type]);
      current.has(id) ? current.delete(id) : current.add(id);
      return { ...prev, [type]: Array.from(current) };
    });
  };

  const handleApplyFilters = () => {
    onFilterChange(selectedFilters);
  };

  const sectionTitles = [
    { key: "nguyen_lieu", label: "Nguyên liệu" },
    { key: "cach_nau", label: "Cách nấu" },
    { key: "loai_bua_an", label: "Loại món ăn" },
    { key: "danh_muc_mon_an", label: "Buổi ăn" },
    { key: "dinh_duong", label: "Dinh dưỡng" },
  ];

  return (
    <div className="w-full mt-10 border rounded-xl p-5 bg-[#FFF8F8]">
      <h3 className="font-bold text-lg mb-4">Bộ lọc</h3>

      {/* Tabs tiêu đề */}
      <div className="flex gap-4 border-b mb-4">
        {sectionTitles.map((section) => {
          const count = selectedFilters[section.key]?.length || 0;
          return (
            <button
              key={section.key}
              onClick={() =>
                setActiveSection((prev) =>
                  prev === section.key ? null : section.key
                )
              }
              className={`relative px-4 py-2 font-semibold border-b-2 ${
                activeSection === section.key
                  ? "border-primaryColor text-primaryColor"
                  : "border-transparent text-gray-600"
              }`}
            >
              {section.label}
              {count > 0 && (
                <span className="absolute -top-1 -right-2 bg-red-500 text-white text-xs font-bold rounded-full w-5 h-5 flex items-center justify-center">
                  {count}
                </span>
              )}
            </button>
          );
        })}
      </div>

      {/* Nội dung hiển thị tương ứng */}
      <div className="mb-6">
        {activeSection === "nguyen_lieu" && (
          <div>
            {Object.entries(ingredients).map(([groupName, items]) => {
              const displayItems = ingredientWhitelist[groupName]
                ? items.filter((item) =>
                    ingredientWhitelist[groupName].includes(item.name)
                  )
                : items;

              if (!displayItems.length) return null;

              return (
                <div key={groupName} className="mb-4">
                  <p className="font-medium">{capitalize(groupName)}</p>
                  <div className="grid grid-cols-4 gap-3 mt-1">
                    {displayItems.map((item) => (
                      <label key={item.id} className="flex gap-2 items-center">
                        <input
                          type="checkbox"
                          onChange={() => handleChange("nguyen_lieu", item.id)}
                        />
                        <span>{item.name}</span>
                      </label>
                    ))}
                  </div>
                </div>
              );
            })}
          </div>
        )}

        {activeSection === "cach_nau" && (
          <div className="grid grid-cols-4 gap-3">
            {cookMethods.map((item) => (
              <label key={item.id} className="flex gap-2 items-center">
                <input
                  type="checkbox"
                  onChange={() => handleChange("cach_nau", item.id)}
                />
                <span>{item.name}</span>
              </label>
            ))}
          </div>
        )}

        {activeSection === "loai_bua_an" && (
          <div className="grid grid-cols-4 gap-3">
            {mealTypes.map((item) => (
              <label key={item.id} className="flex gap-2 items-center">
                <input
                  type="checkbox"
                  onChange={() => handleChange("loai_bua_an", item.id)}
                />
                <span>{item.name}</span>
              </label>
            ))}
          </div>
        )}

        {activeSection === "danh_muc_mon_an" && (
          <div className="grid grid-cols-4 gap-3">
            {mealOfDay.map((item) => (
              <label key={item.id} className="flex gap-2 items-center">
                <input
                  type="checkbox"
                  onChange={() => handleChange("danh_muc_mon_an", item.id)}
                />
                <span>{item.name}</span>
              </label>
            ))}
          </div>
        )}

        {activeSection === "dinh_duong" && (
          <div className="grid grid-cols-4 gap-3">
            {nutritions.map((item) => (
              <label key={item.id} className="flex gap-2 items-center">
                <input
                  type="checkbox"
                  onChange={() => handleChange("dinh_duong", item.id)}
                />
                <span>{item.name}</span>
              </label>
            ))}
          </div>
        )}
      </div>

      <button
        className="px-6 py-2 bg-primaryColor text-white rounded-md hover:opacity-80"
        onClick={handleApplyFilters}
      >
        Lọc thông tin
      </button>
    </div>
  );
};

export default FilterPanel;
