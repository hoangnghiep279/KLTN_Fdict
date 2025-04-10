import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import { validateRecipe } from "../utils/validation";
import Input from "../components/Input";
import fetchUpdateRecipe from "../api/recipes/getRecipeDetail";
export default function UpdateRecipe() {
  const { id } = useParams();
  const [isSubmitted, setIsSubmitted] = useState(false);
  const navigate = useNavigate();
  const [recipe, setRecipe] = useState(null);
  const [loading, setLoading] = useState(true);
  const [message, setMessage] = useState("");
  const [error, setError] = useState({});
  const [newImage, setNewImage] = useState(null);
  const [previewImage, setPreviewImage] = useState("");
  const [newNutritionImage, setNewNutritionImage] = useState(null);
  const [imgNutrition, setImgNutrition] = useState("");

  useEffect(() => {
    fetchUpdateRecipe(
      id,
      setRecipe,
      setPreviewImage,
      setImgNutrition,
      setLoading
    );
  }, [id]);

  // cập nhật field đơn giản
  const handleChange = (e) => {
    const { name, value, type } = e.target;
    let newValue = value;

    if (type === "number" && value !== "") {
      newValue = Number(value);
    }

    setRecipe((prev) => {
      const updatedRecipe = { ...prev, [name]: newValue };

      // Cập nhật lỗi sau khi set recipe
      setError((prevErrors) => ({
        ...prevErrors,
        [name]: validateRecipe(updatedRecipe, [name])[name],
      }));

      return updatedRecipe;
    });
    // setRecipe((prev) => ({
    //   ...prev,
    //   [name]: newValue,
    // }));
    // setError((prevErrors) => ({
    //   ...prevErrors,
    //   [name]: validateRecipe(updatedRecipe, [name])[name],
    // }));
  };
  // cập nhật checkbox
  const handleCheckbox = (e, groupName) => {
    const val = e.target.value;
    const checked = e.target.checked;
    setRecipe((prev) => {
      const s = new Set(prev[groupName]);
      if (checked) s.add(val);
      else s.delete(val);
      return { ...prev, [groupName]: Array.from(s) };
    });
  };

  // cập nhật 1 ingredient
  const handleIngredientChange = (index, field, value) => {
    setRecipe((prev) => {
      const newIngs = prev.ingredients.map((ing, i) =>
        i === index ? { ...ing, [field]: value } : ing
      );
      return { ...prev, ingredients: newIngs };
    });
  };

  const addIngredient = () => {
    setRecipe((prev) => ({
      ...prev,
      ingredients: [
        ...prev.ingredients,
        { name: "", category: "", quantity: "", unit: "" },
      ],
    }));
  };

  // xóa 1 ingredient
  const removeIngredient = (index) => {
    setRecipe((prev) => ({
      ...prev,
      ingredients: prev.ingredients.filter((_, i) => i !== index),
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsSubmitted(true);

    const errors = validateRecipe(recipe, Object.keys(recipe));
    setError(errors);

    if (Object.keys(errors).length > 0) {
      console.log("Có lỗi xảy ra:", errors);
      return;
    }
    try {
      const formData = new FormData();

      // Thêm dữ liệu công thức vào formData
      formData.append("name", recipe.name);
      formData.append("serving_size", recipe.serving_size);
      formData.append("cooking_time", recipe.cooking_time);
      formData.append("difficulty", recipe.difficulty);
      formData.append("calories", recipe.calories);
      formData.append("description", recipe.description);
      formData.append("preparation", recipe.preparation);
      formData.append("instructions", recipe.instructions);
      formData.append("usagefood", recipe.usagefood);
      formData.append("tips", recipe.tips);
      formData.append("expert_advice", recipe.expert_advice);
      formData.append("ingredients", JSON.stringify(recipe.ingredients || []));
      formData.append(
        "mealTypesId",
        JSON.stringify(recipe.selectedMealTypes || [])
      );
      formData.append(
        "mealCateId",
        JSON.stringify(recipe.selectedMealCategories || [])
      );
      formData.append(
        "cookingMethodsId",
        JSON.stringify(recipe.selectedCookingMethods || [])
      );
      formData.append(
        "nutritionNeedsId",
        JSON.stringify(recipe.selectedNutritionNeeds || [])
      );

      // Thêm ảnh nếu có ảnh mới được chọn
      if (newImage) {
        formData.append("img_url", newImage);
      }
      if (newNutritionImage) {
        formData.append("img_nutrition", newNutritionImage);
      }

      // Gửi yêu cầu PUT để cập nhật công thức
      const response = await axios.put(
        `http://localhost:3000/recipe/${id}`,
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        }
      );

      // Kiểm tra kết quả phản hồi từ server
      if (response.status === 200) {
        setMessage("Cập nhật thành công!");
        setTimeout(() => navigate("/"), 1500); // Điều hướng đến trang chủ sau khi thành công
      } else {
        setMessage("Cập nhật thất bại!"); // Thông báo nếu có lỗi xảy ra từ server
      }
    } catch (err) {
      console.error(err);
      setMessage("Có lỗi xảy ra, vui lòng thử lại sau."); // Thông báo lỗi chung
    }
  };

  if (loading) return <p>Đang tải…</p>;
  if (!recipe) return <p>Không tìm thấy công thức</p>;

  return (
    <div className="w-full mt-6">
      <h2 className="text-2xl font-bold mb-4">Sửa Công Thức</h2>
      {message && <p className="text-green-600 mb-4">{message}</p>}
      <form onSubmit={handleSubmit}>
        <div className="grid grid-cols-2 gap-8">
          <Input
            name="name"
            label="Tên công thức"
            value={recipe.name}
            type="text"
            placeholder="Nhập tên công thức"
            handleInput={handleChange}
            isSubmitted={true}
            error={error}
          />
          <div className="mt-4">
            <p className="font-medium mb-1">Ảnh hiện tại:</p>
            <div className="flex items-center gap-3">
              {previewImage && (
                <img
                  src={previewImage}
                  alt="Ảnh món ăn"
                  className="w-20 h-20 object-cover rounded-md mb-2"
                />
              )}
              <input
                type="file"
                accept="image/*"
                onChange={(e) => {
                  const file = e.target.files[0];
                  setNewImage(file);
                  setPreviewImage(URL.createObjectURL(file)); // hiển thị ảnh mới nếu người dùng chọn
                }}
              />
            </div>
          </div>
          <Input
            name="serving_size"
            label="Khẩu phần"
            value={recipe.serving_size}
            type="number"
            placeholder="Khẩu phần ăn"
            handleInput={handleChange}
            isSubmitted={true}
            error={error}
          />
          <Input
            name="cooking_time"
            label="Thời gian nấu (phút)"
            value={recipe.cooking_time}
            type="text"
            placeholder="Nhập tên công thức"
            handleInput={handleChange}
            isSubmitted={true}
            error={error}
          />
          <div>
            <label className="block mb-1 font-medium">Độ khó</label>
            <p className="text-red-500 italic">dễ: 1, trung bình: 2, khó: 3</p>
            <input
              type="number"
              name="difficulty"
              min="0"
              max={"3"}
              value={recipe.difficulty}
              onChange={handleChange}
              className="p-2 bg-[#d3a48618] text-sm border-none outline-none rounded-lg w-4/5"
            />
          </div>
          <Input
            name="calories"
            label="Calo / người"
            value={recipe.calories}
            type="number"
            placeholder="VD:300 kcal/người( Nhập 300)"
            handleInput={handleChange}
            isSubmitted={true}
            error={error}
          />

          <div>
            <label className="block mb-1">Mô tả:</label>
            <textarea
              name="description"
              value={recipe.description}
              onChange={handleChange}
              rows={4}
              className="bg-[#d3a48618] text-sm border-none outline-none rounded-lg w-4/5"
            />
            {isSubmitted && error.description && (
              <p className="text-red-500 mt-2">{error.description}</p>
            )}
          </div>

          <div>
            <label className="block mb-1">Sơ chế:</label>
            <textarea
              name="preparation"
              value={recipe.preparation}
              onChange={handleChange}
              rows={4}
              className="bg-[#d3a48618] text-sm border-none outline-none rounded-lg w-4/5"
            />
          </div>

          <div>
            <label className="block mb-1">Thực hiện:</label>
            <textarea
              name="instructions"
              value={recipe.instructions}
              onChange={handleChange}
              rows={4}
              className="bg-[#d3a48618] text-sm border-none outline-none rounded-lg w-4/5"
            />
          </div>

          <div>
            <label className="block mb-1">Cách dùng:</label>
            <textarea
              name="usagefood"
              value={recipe.usagefood}
              onChange={handleChange}
              rows={4}
              className="bg-[#d3a48618] text-sm border-none outline-none rounded-lg w-4/5"
            />
          </div>
          <div>
            <label className="block mb-1">Mánh nhỏ:</label>
            <textarea
              name="tips"
              value={recipe.tips}
              onChange={handleChange}
              rows={4}
              className="bg-[#d3a48618] text-sm border-none outline-none rounded-lg w-4/5"
            />
          </div>
          <div>
            <label className="block mb-1">Lời khuyên từ chuyên gia:</label>
            <textarea
              name="expert_advice"
              value={recipe.expert_advice}
              onChange={handleChange}
              rows={4}
              className="bg-[#d3a48618] text-sm border-none outline-none rounded-lg w-4/5"
            />
          </div>
          <div className="mt-4">
            <p className="font-medium mb-1">Ảnh dinh dưỡng hiện tại:</p>
            <div className="flex items-center gap-3">
              {imgNutrition && (
                <img
                  src={imgNutrition}
                  alt="Ảnh dinh dưỡng"
                  className="w-20 h-20 object-cover rounded-md mb-2"
                />
              )}
              <input
                type="file"
                accept="image/*"
                onChange={(e) => {
                  const file = e.target.files[0];
                  setNewNutritionImage(file);
                  setImgNutrition(URL.createObjectURL(file)); // Xem trước ảnh mới
                }}
              />
            </div>
          </div>
          {/* ==== Ingredients ==== */}
          <div className="flex flex-col gap-2">
            <p className="mb-2">Nguyên liệu:</p>
            {recipe.ingredients.map((ing, idx) => (
              <div key={idx} className="flex items-center gap-2">
                <input
                  type="text"
                  placeholder="Tên"
                  value={ing.name}
                  onChange={(e) =>
                    handleIngredientChange(idx, "name", e.target.value)
                  }
                  className="w-40 p-2 bg-[#d3a48618] text-sm border-none outline-none rounded-lg"
                />
                <input
                  type="text"
                  placeholder="Loại"
                  value={ing.category}
                  onChange={(e) =>
                    handleIngredientChange(idx, "category", e.target.value)
                  }
                  className="w-32 p-2 bg-[#d3a48618] text-sm border-none outline-none rounded-lg"
                />
                <input
                  type="text"
                  placeholder="Số lượng"
                  value={ing.quantity}
                  onChange={(e) =>
                    handleIngredientChange(idx, "quantity", e.target.value)
                  }
                  className="w-20 p-2 bg-[#d3a48618] text-sm border-none outline-none rounded-lg"
                />
                <div className="flex items-center">
                  <input
                    type="text"
                    placeholder="Đơn vị"
                    value={ing.unit}
                    onChange={(e) =>
                      handleIngredientChange(idx, "unit", e.target.value)
                    }
                    className="w-20 p-2 bg-[#d3a48618] text-sm border-none outline-none rounded-lg"
                  />
                  <button
                    type="button"
                    onClick={() => removeIngredient(idx)}
                    className="ml-2 text-red-500"
                  >
                    &times;
                  </button>
                </div>
              </div>
            ))}
            <button
              type="button"
              onClick={addIngredient}
              className="text-blue-600 hover:underline"
            >
              + Thêm nguyên liệu
            </button>
          </div>
          {/* ==== Checkbox Section ==== */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* Meal Types */}
            <div>
              <p className="font-medium">Loại bữa ăn:</p>
              <div className="flex flex-wrap gap-4">
                {recipe.mealTypes.map((mt) => (
                  <label key={mt.id} className="flex items-center space-x-2">
                    <input
                      type="checkbox"
                      value={mt.id}
                      checked={recipe.selectedMealTypes.includes(mt.id)}
                      onChange={(e) => handleCheckbox(e, "selectedMealTypes")}
                      className="form-checkbox h-5 w-5 text-green-600"
                    />
                    <span>{mt.name}</span>
                  </label>
                ))}
              </div>
            </div>

            {/* Meal Categories */}
            <div>
              <p className="font-medium">Danh mục món ăn:</p>
              <div className="flex flex-wrap gap-4">
                {recipe.mealCategories.map((mc) => (
                  <label key={mc.id} className="flex items-center space-x-2">
                    <input
                      type="checkbox"
                      value={mc.id}
                      checked={recipe.selectedMealCategories.includes(mc.id)}
                      onChange={(e) =>
                        handleCheckbox(e, "selectedMealCategories")
                      }
                      className="form-checkbox h-5 w-5 text-green-600"
                    />
                    <span>{mc.name}</span>
                  </label>
                ))}
              </div>
            </div>
          </div>
          {/* Cooking Methods */}
          <div>
            <p className="font-medium">Phương pháp nấu:</p>
            <div className="flex flex-wrap gap-4">
              {recipe.cookingMethods.map((cm) => (
                <label key={cm.id} className="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    value={cm.id}
                    checked={recipe.selectedCookingMethods.includes(cm.id)}
                    onChange={(e) =>
                      handleCheckbox(e, "selectedCookingMethods")
                    }
                    className="form-checkbox h-5 w-5 text-green-600"
                  />
                  <span>{cm.name}</span>
                </label>
              ))}
            </div>
          </div>
          {/* Nutrition Needs */}
          <div>
            <p className="font-medium">Nhu cầu dinh dưỡng:</p>
            <div className="flex flex-wrap gap-4">
              {recipe.nutritionNeeds.map((nn) => (
                <label key={nn.id} className="flex items-center space-x-2">
                  <input
                    type="checkbox"
                    value={nn.id}
                    checked={recipe.selectedNutritionNeeds.includes(nn.id)}
                    onChange={(e) =>
                      handleCheckbox(e, "selectedNutritionNeeds")
                    }
                    className="form-checkbox h-5 w-5 text-green-600"
                  />
                  <span>{nn.name}</span>
                </label>
              ))}
            </div>
          </div>
        </div>

        <button
          type="submit"
          className="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 mt-4"
        >
          Cập nhật công thức
        </button>
      </form>
    </div>
  );
}
