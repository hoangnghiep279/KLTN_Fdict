import React, { useState, useEffect } from "react";
import { validateRecipe } from "../utils/validation";
import { IoIosPeople } from "react-icons/io";
import CheckboxGroup from "../components/CheckboxGroup";
import insertRecipe from "../api/recipes/insert";
import Input from "../components/Input";
import TextArea from "../components/TextArea";
function InsertRecipe() {
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [error, setError] = useState({});
  const [mealTypesId, setMealTypesId] = useState([]);
  const [cookingMethodsId, setCookingMethodsId] = useState([]);
  const [nutritionNeedsId, setNutritionNeedsId] = useState([]);
  const [mealCateId, setMealCateId] = useState([]);
  const [values, setValue] = useState({
    name: "",
    img_url: "",
    serving_size: "",
    cooking_time: "",
    difficulty: 0,
    calories: "",
    description: "",
    preparation: "",
    instructions: "",
    usagefood: "",
    tips: "",
    expert_advice: "",
    img_nutrition: "",
    ingredients: [],
    mealTypesId: [],
    cookingMethodsId: [],
    nutritionNeedsId: [],
    mealCateId: [],
  });

  const addIngredient = () => {
    setValue((prev) => ({
      ...prev,
      ingredients: [
        ...prev.ingredients,
        { name: "", category: "", quantity: "", unit: "" },
      ],
    }));
  };

  const handleIngredientChange = (index, field, value) => {
    const updatedIngredients = [...values.ingredients];
    updatedIngredients[index][field] = value;
    setValue((prev) => ({ ...prev, ingredients: updatedIngredients }));
  };

  const handleInput = (e) => {
    const { name, value, type, files } = e.target;
    let processedValue = value;

    if (type === "file" && files.length > 0) {
      processedValue = files[0];
    } else if (["serving_size", "calories"].includes(name)) {
      processedValue = value ? String(Number(value)) : "";
    }

    setValue((prevValues) => ({
      ...prevValues,
      [name]: processedValue,
    }));

    setError((prevErrors) => ({
      ...prevErrors,
      [name]: validateRecipe({ ...values, [name]: processedValue }, [name])[
        name
      ],
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsSubmitted(true);

    const errors = validateRecipe(values, Object.keys(values));
    setError(errors);

    if (Object.keys(errors).length > 0) {
      console.log("Có lỗi xảy ra:", errors);
      return;
    }

    try {
      const updatedValues = {
        ...values,
        mealTypesId,
        cookingMethodsId,
        nutritionNeedsId,
        mealCateId,
      };

      const formData = new FormData();

      for (const key in updatedValues) {
        if (
          [
            "ingredients",
            "mealTypesId",
            "cookingMethodsId",
            "nutritionNeedsId",
            "mealCateId",
          ].includes(key)
        ) {
          formData.append(key, JSON.stringify(updatedValues[key]));
        } else if (["img_url", "img_nutrition"].includes(key)) {
          if (updatedValues[key] instanceof File) {
            formData.append(key, updatedValues[key]);
          } else {
            console.warn(`⚠️ ${key} không phải file, bỏ qua`);
          }
        } else {
          formData.append(key, updatedValues[key]);
        }
      }
      console.log(
        "🔍 Dữ liệu gửi lên backend:",
        Object.fromEntries(formData.entries())
      );

      await insertRecipe(formData);
      setValue({
        name: "",
        img_url: "",
        serving_size: "",
        cooking_time: "",
        difficulty: Number(values.difficulty),
        calories: "",
        description: "",
        preparation: "",
        instructions: "",
        usagefood: "",
        tips: "",
        expert_advice: "",
        img_nutrition: "",
        ingredients: [],
        mealTypesId: [],
        cookingMethodsId: [],
        nutritionNeedsId: [],
        mealCateId: [],
      });

      setMealTypesId([]);
      setCookingMethodsId([]);
      setNutritionNeedsId([]);
      setMealCateId([]);
    } catch (error) {
      console.error("Lỗi khi thêm công thức:", error);
    }
  };

  return (
    <div className="p-14">
      <h1 className="text-3xl font-bold mb-5">Thêm công thức</h1>
      <form onSubmit={handleSubmit}>
        <div className="grid grid-cols-2 gap-4">
          <Input
            name="name"
            label="🍔 Tên món ăn"
            type="text"
            placeholder="Cá chiên giòn"
            value={values.name}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <div>
            <label className="text-base block">Ảnh món ăn</label>
            <input
              className="w-[80%] p-2 bg-[#d3a48618] text-sm placeholder:text-gray-650 border-none outline-none rounded-lg my-2"
              type="file"
              name="img_url"
              onChange={handleInput}
              accept="image/*"
            />
            {isSubmitted && error.img_url && (
              <p className="text-red-500 mt-2">{error.img_url}</p>
            )}
          </div>
          <Input
            name="serving_size"
            label={
              <>
                <IoIosPeople className="text-lg inline-block mr-1" /> Khẩu phần
                ăn
              </>
            }
            type="number"
            placeholder="Ví dụ cho bốn người: 4"
            value={values.serving_size}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <Input
            name="cooking_time"
            label="⏳ Thời gian nấu"
            type="text"
            placeholder="30 phút hoặc 1 giờ"
            value={values.cooking_time}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <Input
            name="difficulty"
            label="📊 Độ khó"
            type="number"
            placeholder="dễ: 1, trung bình: 2, khó: 3"
            value={values.difficulty}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <Input
            name="calories"
            label="📏 Calo cho mỗi người"
            type="number"
            placeholder="VD:300 kcal/người( Nhập 300)"
            value={values.calories}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />

          <TextArea
            name="description"
            label="📃 Mô tả món ăn"
            placeholder="Nhập mô tả món ăn..."
            value={values.description}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <TextArea
            name="preparation"
            label="🍴 Sơ chế"
            placeholder="Sơ chế món ăn ..."
            value={values.preparation}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <TextArea
            name="instructions"
            label="🔪 Cách thực hiện"
            placeholder="Cách làm món ăn ..."
            value={values.instructions}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <TextArea
            name="usagefood"
            label="🍛 Cách dùng"
            placeholder="Cách dùng món ăn ..."
            value={values.usagefood}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <TextArea
            name="tips"
            label="📢 Mách nhỏ"
            placeholder="mẹo nhỏ để món ăn ngon hơn ..."
            value={values.tips}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <TextArea
            name="expert_advice"
            label="Lời Khuyên của chuyên gia dinh dưỡng"
            placeholder="mẹo nhỏ để món ăn ngon hơn ..."
            value={values.expert_advice}
            handleInput={handleInput}
            isSubmitted={isSubmitted}
            error={error}
          />
          <div>
            <label className="text-base block">
              Ảnh thực đơn về dinh dưỡng
            </label>
            <input
              className="w-[80%] p-2 bg-[#d3a48618] text-sm placeholder:text-gray-650 border-none outline-none rounded-lg my-2"
              type="file"
              name="img_nutrition"
              onChange={handleInput}
              accept="image/*"
            />
            {isSubmitted && error.img_nutrition && (
              <p className="text-red-500 mt-2">{error.img_nutrition}</p>
            )}
          </div>

          <div className="col-span-2">
            <label className="text-base block">🥕 Nguyên liệu:</label>
            {values.ingredients.map((ingredient, index) => (
              <div key={index} className="flex gap-2 mb-2">
                <input
                  className="w-40 p-2 bg-[#d3a48618] text-sm border-none outline-none rounded-lg"
                  type="text"
                  placeholder="Tên nguyên liệu"
                  value={ingredient.name}
                  onChange={(e) =>
                    handleIngredientChange(index, "name", e.target.value)
                  }
                />
                <input
                  className="w-32 p-2 bg-[#d3a48618] text-sm border-none outline-none rounded-lg"
                  type="text"
                  placeholder="Loại"
                  value={ingredient.category}
                  onChange={(e) =>
                    handleIngredientChange(index, "category", e.target.value)
                  }
                />
                <input
                  className="w-20 p-2 bg-[#d3a48618] text-sm border-none outline-none rounded-lg"
                  type="number"
                  placeholder="Số lượng"
                  value={ingredient.quantity}
                  onChange={(e) =>
                    handleIngredientChange(index, "quantity", e.target.value)
                  }
                />
                <input
                  className="w-20 p-2 bg-[#d3a48618] text-sm border-none outline-none rounded-lg"
                  type="text"
                  placeholder="Đơn vị"
                  value={ingredient.unit}
                  onChange={(e) =>
                    handleIngredientChange(index, "unit", e.target.value)
                  }
                />
              </div>
            ))}
            <button
              type="button"
              className="bg-green-500 text-white px-4 py-2 rounded-lg"
              onClick={addIngredient}
            >
              ➕ Thêm nguyên liệu
            </button>
          </div>
          <CheckboxGroup
            apiUrl="http://localhost:3000/mealtype"
            title="Chọn loại món ăn"
            selectedItems={mealTypesId}
            name="mealTypesId"
            setSelectedItems={setMealTypesId}
            isSubmitted={isSubmitted}
            error={error}
          />

          <CheckboxGroup
            apiUrl="http://localhost:3000/cookmethod"
            title="Chọn loại món ăn"
            selectedItems={cookingMethodsId}
            name="cookingMethodsId"
            setSelectedItems={setCookingMethodsId}
            isSubmitted={isSubmitted}
            error={error}
          />

          <CheckboxGroup
            apiUrl="http://localhost:3000/nutrition"
            title="Chọn loại món ăn"
            selectedItems={nutritionNeedsId}
            setSelectedItems={setNutritionNeedsId}
          />
          <CheckboxGroup
            apiUrl="http://localhost:3000/mealofday"
            title="Chọn loại món ăn"
            selectedItems={mealCateId}
            name="mealCateId"
            setSelectedItems={setMealCateId}
            isSubmitted={isSubmitted}
            error={error}
          />
        </div>

        <div className="mt-4 text-right">
          <button
            type="submit"
            className="px-5 py-2 bg-blue-500 text-white rounded-lg"
          >
            Thêm công thức
          </button>
        </div>
      </form>
    </div>
  );
}

export default InsertRecipe;
