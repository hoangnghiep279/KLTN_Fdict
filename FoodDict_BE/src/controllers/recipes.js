const db = require("../config/database");
const fs = require("fs");
const path = require("path");

async function getRecipe(page = 1, limit = 10) {
  try {
    const offset = (page - 1) * limit;

    const [rows] = await db.execute(
      `
      SELECT 
        r.id, 
        r.name, 
        r.img_url, 
        r.serving_size, 
        r.cooking_time, 
        r.difficulty, 
        COUNT(f.recipe_id) AS favorite_count
      FROM recipes r
      LEFT JOIN favorite_recipes f ON r.id = f.recipe_id
      GROUP BY r.id, r.name, r.img_url, r.serving_size, r.cooking_time, 
               r.difficulty
      ORDER BY favorite_count DESC
      LIMIT ? OFFSET ?
    `,
      [limit, offset]
    );

    const [[{ total }]] = await db.execute(`
      SELECT COUNT(*) AS total FROM recipes
    `);

    return {
      code: 200,
      data: rows,
      pagination: {
        currentPage: page, // trang hiện tại
        totalPages: Math.ceil(total / limit), // tổng trang
        totalRecipes: total, //tổng món ăn
      },
    };
  } catch (error) {
    throw error;
  }
}

async function searchRecipes({
  keyword = "",
  dinh_duong = [],
  nguyen_lieu = [],
  cach_nau = [],
  loai_bua_an = [],
  danh_muc_mon_an = [],
}) {
  try {
    const conditions = [];
    const values = [];

    // Keyword search (by recipe name)
    if (keyword.trim() !== "") {
      conditions.push(`r.name LIKE ?`);
      values.push(`%${keyword}%`);
    }

    if (dinh_duong.length > 0) {
      conditions.push(
        `rn.nutrition_needs_id IN (${dinh_duong.map(() => "?").join(",")})`
      );
      values.push(...dinh_duong);
    }

    if (nguyen_lieu.length > 0) {
      conditions.push(
        `ri.ingredient_id IN (${nguyen_lieu.map(() => "?").join(",")})`
      );
      values.push(...nguyen_lieu);
    }

    if (cach_nau.length > 0) {
      conditions.push(
        `rc.cooking_method_id IN (${cach_nau.map(() => "?").join(",")})`
      );
      values.push(...cach_nau);
    }

    if (loai_bua_an.length > 0) {
      conditions.push(
        `mt.mealtype_id IN (${loai_bua_an.map(() => "?").join(",")})`
      );
      values.push(...loai_bua_an);
    }

    if (danh_muc_mon_an.length > 0) {
      conditions.push(
        `mc.meal_category_id IN (${danh_muc_mon_an.map(() => "?").join(",")})`
      );
      values.push(...danh_muc_mon_an);
    }

    const sql = `
      SELECT DISTINCT r.*
      FROM recipes r
      LEFT JOIN recipe_nutrition_needs rn ON r.id = rn.recipe_id
      LEFT JOIN recipe_ingredients ri ON r.id = ri.recipe_id
      LEFT JOIN recipe_cooking_methods rc ON r.id = rc.recipe_id
      LEFT JOIN recipe_meal_types mt ON r.id = mt.recipe_id
      LEFT JOIN recipe_meal_categories mc ON r.id = mc.recipe_id
      ${conditions.length > 0 ? "WHERE " + conditions.join(" AND ") : ""}
    `;

    const [results] = await db.query(sql, values);
    return { code: 200, data: results };
  } catch (error) {
    throw error;
  }
}

// async function searchRecipes({
//   dinh_duong = [],
//   nguyen_lieu = [],
//   cach_nau = [],
//   loai_bua_an = [],
//   danh_muc_mon_an = [],
// }) {
//   try {
//     const conditions = [];
//     const values = [];

//     if (dinh_duong.length > 0) {
//       conditions.push(
//         `rn.nutrition_needs_id IN (${dinh_duong.map(() => "?").join(",")})`
//       );
//       values.push(...dinh_duong);
//     }

//     if (nguyen_lieu.length > 0) {
//       conditions.push(
//         `ri.ingredient_id IN (${nguyen_lieu.map(() => "?").join(",")})`
//       );
//       values.push(...nguyen_lieu);
//     }

//     if (cach_nau.length > 0) {
//       conditions.push(
//         `rc.cooking_method_id IN (${cach_nau.map(() => "?").join(",")})`
//       );
//       values.push(...cach_nau);
//     }

//     if (loai_bua_an.length > 0) {
//       conditions.push(
//         `mt.mealtype_id IN (${loai_bua_an.map(() => "?").join(",")})`
//       );
//       values.push(...loai_bua_an);
//     }

//     if (danh_muc_mon_an.length > 0) {
//       conditions.push(
//         `mc.meal_category_id IN (${danh_muc_mon_an.map(() => "?").join(",")})`
//       );
//       values.push(...danh_muc_mon_an);
//     }

//     const sql = `
//       SELECT DISTINCT r.*
//       FROM recipes r
//       LEFT JOIN recipe_nutrition_needs rn ON r.id = rn.recipe_id
//       LEFT JOIN recipe_ingredients ri ON r.id = ri.recipe_id
//       LEFT JOIN recipe_cooking_methods rc ON r.id = rc.recipe_id
//       LEFT JOIN recipe_meal_types mt ON r.id = mt.recipe_id
//       LEFT JOIN recipe_meal_categories mc ON r.id = mc.recipe_id
//       ${conditions.length > 0 ? "WHERE (" + conditions.join(" OR ") + ")" : ""}
//     `;

//     const [results] = await db.query(sql, values);
//     return { code: 200, data: results };
//   } catch (error) {
//     throw error;
//   }
// }

async function getRecipeById(id) {
  try {
    // Kiểm tra id có hợp lệ không
    if (!id) {
      const error = new Error("Thiếu ID món ăn");
      error.statusCode = 400;
      throw error;
    }

    // Truy vấn thông tin món ăn
    const [recipe] = await db.query(
      `SELECT id, name, img_url, serving_size, cooking_time, difficulty, calories, 
              description, preparation, instructions, usagefood, tips, 
              expert_advice, img_nutrition 
       FROM recipes WHERE id = ?`,
      [id]
    );

    if (recipe.length === 0) {
      const error = new Error("Món ăn không tồn tại!");
      error.statusCode = 404;
      throw error;
    }

    // Truy vấn thành phần món ăn
    const [ingredients] = await db.query(
      `SELECT i.id, i.name, i.category, i.type, ri.quantity, ri.unit
       FROM recipe_ingredients ri
       JOIN ingredients i ON ri.ingredient_id = i.id
       WHERE ri.recipe_id = ?`,
      [id]
    );

    return {
      recipe: recipe[0],
      ingredients,
    };
  } catch (error) {
    throw error; // Để router xử lý lỗi
  }
}

async function insertRecipe(recipe) {
  let connection;
  try {
    connection = await db.getConnection(); // Lấy kết nối từ pool
    await connection.beginTransaction(); // Bắt đầu transaction

    const [existingRecipe] = await connection.query(
      "SELECT id FROM recipes WHERE name = ? LIMIT 1",
      [recipe.name]
    );

    if (existingRecipe.length > 0) {
      throw new Error("Món ăn đã tồn tại trong cơ sở dữ liệu");
    }
    if (typeof recipe.ingredients === "string") {
      recipe.ingredients = JSON.parse(recipe.ingredients);
    }
    if (typeof recipe.mealTypesId === "string") {
      recipe.mealTypesId = JSON.parse(recipe.mealTypesId);
    }
    if (typeof recipe.cookingMethodsId === "string") {
      recipe.cookingMethodsId = JSON.parse(recipe.cookingMethodsId);
    }
    if (typeof recipe.nutritionNeedsId === "string") {
      recipe.nutritionNeedsId = JSON.parse(recipe.nutritionNeedsId);
    }
    if (typeof recipe.mealCateId === "string") {
      recipe.mealCateId = JSON.parse(recipe.mealCateId);
    }
    // Tạo công thức món ăn
    const [recipeResult] = await connection.query(
      `INSERT INTO recipes (id, name, img_url, serving_size, cooking_time, difficulty, calories, description, preparation, instructions, usagefood, tips, expert_advice, img_nutrition) 
      VALUES (uuid(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [
        recipe.name,
        recipe.img_url, // Đã có từ router
        recipe.serving_size,
        recipe.cooking_time,
        recipe.difficulty,
        recipe.calories,
        recipe.description,
        recipe.preparation,
        recipe.instructions,
        recipe.usagefood,
        recipe.tips,
        recipe.expert_advice,
        recipe.img_nutrition, // Đã có từ router
      ]
    );

    // Lấy ID của công thức vừa thêm
    const [recipeIdResult] = await connection.query(
      "SELECT id FROM recipes WHERE name = ? ORDER BY created_at DESC LIMIT 1",
      [recipe.name]
    );
    const recipeId = recipeIdResult[0]?.id;
    if (!recipeId) throw new Error("Không thể lấy ID công thức");

    // Thêm nguyên liệu
    for (let ing of recipe.ingredients || []) {
      if (!ing.name || !ing.category || !ing.type) {
        // console.warn("⚠️ Nguyên liệu không hợp lệ:", ing);
        continue; // bỏ qua nếu thiếu thông tin
      }

      let [ingredientResult] = await connection.query(
        "SELECT id FROM ingredients WHERE name = ? AND category = ? AND type = ?",
        [ing.name, ing.category, ing.type]
      );

      let ingredientId =
        ingredientResult.length > 0 ? ingredientResult[0].id : null;

      if (!ingredientId) {
        const [newIngredient] = await connection.query(
          "INSERT INTO ingredients (id, name, category, type) VALUES (UUID(), ?, ?, ?)",
          [ing.name, ing.category, ing.type]
        );
        const [newIngResult] = await connection.query(
          "SELECT id FROM ingredients WHERE name = ? AND category = ? AND type = ?",
          [ing.name, ing.category, ing.type]
        );
        ingredientId = newIngResult[0]?.id;
      }

      if (!ingredientId) throw new Error("Không thể lấy ID nguyên liệu");

      await connection.query(
        "INSERT INTO recipe_ingredients (id, recipe_id, ingredient_id, quantity, unit) VALUES (UUID(), ?, ?, ?, ?)",
        [recipeId, ingredientId, ing.quantity, ing.unit]
      );
    }

    // Thêm loại bữa ăn
    for (let mealType of recipe.mealTypesId || []) {
      await connection.query(
        "INSERT INTO recipe_meal_types (id, recipe_id, mealtype_id) VALUES (UUID(), ?, ?)",
        [recipeId, mealType]
      );
    }
    for (let mealType of recipe.mealCateId || []) {
      await connection.query(
        "INSERT INTO recipe_meal_categories (id, recipe_id, meal_category_id) VALUES (UUID(), ?, ?)",
        [recipeId, mealType]
      );
    }

    // Thêm phương pháp nấu ăn
    for (let method of recipe.cookingMethodsId || []) {
      await connection.query(
        "INSERT INTO recipe_cooking_methods (id, recipe_id, cooking_method_id) VALUES (UUID(), ?, ?)",
        [recipeId, method]
      );
    }

    // Thêm nhu cầu dinh dưỡng
    for (let need of recipe.nutritionNeedsId || []) {
      await connection.query(
        "INSERT INTO recipe_nutrition_needs (id, recipe_id, nutrition_needs_id) VALUES (UUID(), ?, ?)",
        [recipeId, need]
      );
    }

    await connection.commit(); // Xác nhận transaction
    return { message: "Thêm công thức thành công!", recipeId };
  } catch (error) {
    if (connection) await connection.rollback(); // Hoàn tác transaction nếu lỗi
    console.error("Lỗi khi thêm công thức:", error);
    throw error;
  } finally {
    if (connection) connection.release(); // Giải phóng kết nối
  }
}

async function getRecipeUpdate(recipeId) {
  let connection;
  try {
    connection = await db.getConnection();

    // 1. Lấy thông tin công thức
    const [recipeResult] = await connection.query(
      `SELECT * FROM recipes WHERE id = ?`,
      [recipeId]
    );
    if (recipeResult.length === 0) {
      throw new Error("Không tìm thấy công thức");
    }
    const recipe = recipeResult[0];

    // 2. Lấy nguyên liệu (như trước)
    const [ingredients] = await connection.query(
      `SELECT i.id, i.name, i.category,i.type, ri.quantity, ri.unit
       FROM recipe_ingredients ri 
       JOIN ingredients i ON ri.ingredient_id = i.id 
       WHERE ri.recipe_id = ?`,
      [recipeId]
    );

    // 3. Lấy toàn bộ meal types và đánh dấu checked
    const [allMealTypes] = await connection.query(
      `SELECT id, name FROM meal_type`
    );
    const [linkedMealTypes] = await connection.query(
      `SELECT mealtype_id FROM recipe_meal_types WHERE recipe_id = ?`,
      [recipeId]
    );
    const linkedTypeIds = new Set(linkedMealTypes.map((m) => m.mealtype_id));
    const mealTypes = allMealTypes.map((mt) => ({
      id: mt.id,
      name: mt.name,
      checked: linkedTypeIds.has(mt.id),
    }));

    // 4. Lấy toàn bộ meal categories và đánh dấu checked
    const [allMealCategories] = await connection.query(
      `SELECT id, name FROM meal_categories`
    );
    const [linkedMealCategories] = await connection.query(
      `SELECT meal_category_id FROM recipe_meal_categories WHERE recipe_id = ?`,
      [recipeId]
    );
    const linkedCatIds = new Set(
      linkedMealCategories.map((m) => m.meal_category_id)
    );
    const mealCategories = allMealCategories.map((mc) => ({
      id: mc.id,
      name: mc.name,
      checked: linkedCatIds.has(mc.id),
    }));

    // 5. Lấy toàn bộ cooking methods và đánh dấu checked
    const [allCookingMethods] = await connection.query(
      `SELECT id, name FROM cooking_methods`
    );
    const [linkedCookingMethods] = await connection.query(
      `SELECT cooking_method_id FROM recipe_cooking_methods WHERE recipe_id = ?`,
      [recipeId]
    );
    const linkedCookIds = new Set(
      linkedCookingMethods.map((m) => m.cooking_method_id)
    );
    const cookingMethods = allCookingMethods.map((cm) => ({
      id: cm.id,
      name: cm.name,
      checked: linkedCookIds.has(cm.id),
    }));

    // 6. Lấy toàn bộ nutrition needs và đánh dấu checked
    const [allNutritionNeeds] = await connection.query(
      `SELECT id, name FROM nutrition_needs`
    );
    const [linkedNutritionNeeds] = await connection.query(
      `SELECT nutrition_needs_id FROM recipe_nutrition_needs WHERE recipe_id = ?`,
      [recipeId]
    );
    const linkedNutIds = new Set(
      linkedNutritionNeeds.map((n) => n.nutrition_needs_id)
    );
    const nutritionNeeds = allNutritionNeeds.map((nn) => ({
      id: nn.id,
      name: nn.name,
      checked: linkedNutIds.has(nn.id),
    }));

    // 7. Trả về object đầy đủ
    return {
      ...recipe,
      ingredients,
      mealTypes,
      mealCategories,
      cookingMethods,
      nutritionNeeds,
    };
  } catch (error) {
    console.error("Lỗi khi lấy công thức:", error);
    throw error;
  } finally {
    if (connection) connection.release();
  }
}

async function updateRecipe(recipeId, recipe) {
  let connection;
  try {
    connection = await db.getConnection();
    await connection.beginTransaction();

    const [rows] = await connection.query(
      `SELECT img_url, img_nutrition FROM recipes WHERE id = ?`,
      [recipeId]
    );

    if (!rows.length) throw new Error("Công thức không tồn tại");

    const oldImgUrl = rows[0].img_url;
    const oldImgNutrition = rows[0].img_nutrition;

    // Xóa ảnh cũ nếu có ảnh mới
    if (recipe.img_url && oldImgUrl) {
      const oldImgPath = path.join(__dirname, "../", oldImgUrl);
      if (fs.existsSync(oldImgPath)) {
        fs.unlink(oldImgPath, (err) => {
          if (err) console.error("Lỗi khi xóa ảnh cũ:", err);
        });
      } else {
        console.warn("Ảnh cũ không tồn tại:", oldImgPath);
      }
    }

    if (recipe.img_nutrition && oldImgNutrition) {
      const oldNutritionPath = path.join(__dirname, "../", oldImgNutrition);
      if (fs.existsSync(oldNutritionPath)) {
        fs.unlink(oldNutritionPath, (err) => {
          if (err) console.error("Lỗi khi xóa ảnh dinh dưỡng cũ:", err);
        });
      } else {
        console.warn("Ảnh dinh dưỡng cũ không tồn tại:", oldNutritionPath);
      }
    }

    // Cập nhật công thức
    await connection.query(
      `UPDATE recipes SET name = ?, img_url = ?, serving_size = ?, cooking_time = ?, 
       difficulty = ?, calories = ?, description = ?, preparation = ?, instructions = ?, 
       usagefood = ?, tips = ?, expert_advice = ?, img_nutrition = ? 
       WHERE id = ?`,
      [
        recipe.name,
        recipe.img_url || oldImgUrl, // Nếu không có ảnh mới, dùng ảnh cũ
        recipe.serving_size,
        recipe.cooking_time,
        recipe.difficulty,
        recipe.calories,
        recipe.description,
        recipe.preparation,
        recipe.instructions,
        recipe.usagefood,
        recipe.tips,
        recipe.expert_advice,
        recipe.img_nutrition || oldImgNutrition, // Nếu không có ảnh dinh dưỡng mới, dùng ảnh cũ
        recipeId,
      ]
    );

    let ingredients = recipe.ingredients ? JSON.parse(recipe.ingredients) : [];

    // Sau đó, lặp qua các nguyên liệu và xử lý như bình thường
    for (let ing of ingredients) {
      // Kiểm tra nguyên liệu đã tồn tại chưa
      let [ingredientResult] = await connection.query(
        "SELECT id FROM ingredients WHERE name = ? AND category = ? AND type = ?",
        [ing.name, ing.category, ing.type]
      );

      let ingredientId =
        ingredientResult.length > 0 ? ingredientResult[0].id : null;

      // Nếu nguyên liệu chưa có, thêm mới vào bảng ingredients
      if (!ingredientId) {
        await connection.query(
          "INSERT INTO ingredients (id, name, category,type) VALUES (uuid(), ?, ?,?)",
          [ing.name, ing.category, ing.type]
        );

        // Lấy lại id của nguyên liệu mới thêm vào
        const [newIngResult] = await connection.query(
          "SELECT id FROM ingredients WHERE name = ? AND category = ? AND type = ?",
          [ing.name, ing.category, ing.type]
        );
        ingredientId = newIngResult[0]?.id;
      } else {
        await connection.query(
          "UPDATE recipe_ingredients SET quantity = ?, unit = ? WHERE recipe_id = ? AND ingredient_id = ?",
          [ing.quantity, ing.unit, recipeId, ingredientId]
        );
      }

      const [existingRecipeIngredient] = await connection.query(
        "SELECT id FROM recipe_ingredients WHERE recipe_id = ? AND ingredient_id = ?",
        [recipeId, ingredientId]
      );

      if (existingRecipeIngredient.length === 0) {
        await connection.query(
          "INSERT INTO recipe_ingredients (id, recipe_id, ingredient_id, quantity, unit) VALUES (uuid(), ?, ?, ?, ?)",
          [recipeId, ingredientId, ing.quantity, ing.unit]
        );
      }
    }

    const mealTypesId = recipe.mealTypesId
      ? JSON.parse(recipe.mealTypesId)
      : [];
    const mealCateId = recipe.mealCateId ? JSON.parse(recipe.mealCateId) : [];
    const cookingMethodsId = recipe.cookingMethodsId
      ? JSON.parse(recipe.cookingMethodsId)
      : [];
    const nutritionNeedsId = recipe.nutritionNeedsId
      ? JSON.parse(recipe.nutritionNeedsId)
      : [];
    // Xóa & thêm lại loại bữa ăn
    await connection.query(
      `DELETE FROM recipe_meal_types WHERE recipe_id = ?`,
      [recipeId]
    );
    for (let mealType of mealTypesId || []) {
      await connection.query(
        "INSERT INTO recipe_meal_types (id, recipe_id, mealtype_id) VALUES (UUID(), ?, ?)",
        [recipeId, mealType]
      );
    }

    await connection.query(
      `DELETE FROM recipe_meal_categories WHERE recipe_id = ?`,
      [recipeId]
    );
    for (let mealType of mealCateId || []) {
      await connection.query(
        "INSERT INTO recipe_meal_categories (id, recipe_id, meal_category_id) VALUES (UUID(), ?, ?)",
        [recipeId, mealType]
      );
    }

    // Xóa & thêm lại phương pháp nấu ăn
    await connection.query(
      `DELETE FROM recipe_cooking_methods WHERE recipe_id = ?`,
      [recipeId]
    );
    for (let method of cookingMethodsId || []) {
      await connection.query(
        "INSERT INTO recipe_cooking_methods (id, recipe_id, cooking_method_id) VALUES (UUID(), ?, ?)",
        [recipeId, method]
      );
    }

    // Xóa & thêm lại nhu cầu dinh dưỡng
    await connection.query(
      `DELETE FROM recipe_nutrition_needs WHERE recipe_id = ?`,
      [recipeId]
    );
    for (let need of nutritionNeedsId || []) {
      await connection.query(
        "INSERT INTO recipe_nutrition_needs (id, recipe_id, nutrition_needs_id) VALUES (UUID(), ?, ?)",
        [recipeId, need]
      );
    }

    await connection.commit();
    return { message: "Cập nhật công thức thành công!" };
  } catch (error) {
    if (connection) await connection.rollback();
    console.error("Lỗi khi cập nhật công thức:", error);
    throw error;
  } finally {
    if (connection) connection.release();
  }
}

async function deleteRecipe(recipeId) {
  let connection;
  try {
    connection = await db.getConnection();
    await connection.beginTransaction(); // Bắt đầu transaction

    // Lấy thông tin ảnh để xóa
    const [recipe] = await connection.query(
      "SELECT img_url, img_nutrition FROM recipes WHERE id = ?",
      [recipeId]
    );

    if (!recipe.length) {
      throw new Error("Không tìm thấy công thức để xóa");
    }

    const oldImgUrl = recipe[0].img_url;
    const oldImgNutrition = recipe[0].img_nutrition;

    // Xóa ảnh nếu tồn tại
    if (oldImgUrl) {
      const imgPath = path.join(__dirname, "../", oldImgUrl);
      if (fs.existsSync(imgPath)) fs.unlinkSync(imgPath);
    }

    if (oldImgNutrition) {
      const nutritionImgPath = path.join(__dirname, "../", oldImgNutrition);
      if (fs.existsSync(nutritionImgPath)) fs.unlinkSync(nutritionImgPath);
    }

    await connection.query("DELETE FROM favorite_recipes WHERE recipe_id = ?", [
      recipeId,
    ]);

    // Xóa dữ liệu liên quan trong các bảng trung gian
    await connection.query(
      "DELETE FROM recipe_ingredients WHERE recipe_id = ?",
      [recipeId]
    );
    await connection.query(
      "DELETE FROM recipe_meal_types WHERE recipe_id = ?",
      [recipeId]
    );
    await connection.query(
      "DELETE FROM recipe_meal_categories WHERE recipe_id = ?",
      [recipeId]
    );
    await connection.query(
      "DELETE FROM recipe_cooking_methods WHERE recipe_id = ?",
      [recipeId]
    );
    await connection.query(
      "DELETE FROM recipe_nutrition_needs WHERE recipe_id = ?",
      [recipeId]
    );

    // Cuối cùng, xóa công thức khỏi bảng recipes
    const [deleteResult] = await connection.query(
      "DELETE FROM recipes WHERE id = ?",
      [recipeId]
    );

    if (deleteResult.affectedRows === 0) {
      throw new Error("Không tìm thấy công thức để xóa");
    }

    await connection.commit(); // Xác nhận transaction
    return { message: "Xóa công thức thành công!" };
  } catch (error) {
    if (connection) await connection.rollback(); // Hoàn tác nếu lỗi
    console.error("Lỗi khi xóa công thức:", error);
    throw error;
  } finally {
    if (connection) connection.release(); // Giải phóng kết nối
  }
}

module.exports = {
  getRecipe,
  searchRecipes,
  getRecipeById,
  getRecipeUpdate,
  insertRecipe,
  updateRecipe,
  deleteRecipe,
};
