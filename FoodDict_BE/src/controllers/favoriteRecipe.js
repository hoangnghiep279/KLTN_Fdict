const db = require("../config/database");

async function getFavoriteRecipes(userId, page = 1, limit = 10) {
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
        COUNT(f.recipe_id) AS favorite_count,
        1 AS is_favorite
      FROM favorite_recipes f
      JOIN recipes r ON f.recipe_id = r.id
      WHERE f.user_id = ?
      GROUP BY r.id, r.name, r.img_url, r.serving_size, r.cooking_time, r.difficulty
      ORDER BY favorite_count DESC
      LIMIT ? OFFSET ?
      `,
      [userId, limit, offset]
    );

    // Truy vấn tổng số món ăn yêu thích của người dùng
    const [[{ total }]] = await db.execute(
      `
      SELECT COUNT(*) AS total 
      FROM favorite_recipes 
      WHERE user_id = ?
      `,
      [userId]
    );

    return {
      code: 200,
      data: rows,
      pagination: {
        currentPage: page,
        totalPages: Math.ceil(total / limit),
        totalFavorites: total,
      },
    };
  } catch (error) {
    throw error;
  }
}

  async function addFavoriteRecipe(userId, recipe) {
    try {
      // Kiểm tra xem có thiếu userId hoặc recipeId không
      if (!userId || !recipe || !recipe.recipeId) {
        return { code: 400, message: "Thiếu userId hoặc recipeId!" };
      }
  
      // Kiểm tra nếu món ăn đã có trong danh sách yêu thích
      const [existingFavorite] = await db.execute(
        `SELECT * FROM favorite_recipes WHERE user_id = ? AND recipe_id = ?`,
        [userId, recipe.recipeId]
      );
  
      // Nếu đã tồn tại, trả về thông báo lỗi
      if (existingFavorite && existingFavorite.length > 0) {
        return { code: 400, message: "Bạn đã yêu thích món ăn!" };
      }
  
      // Nếu chưa tồn tại, thêm món ăn vào yêu thích
      await db.execute(
        `INSERT INTO \`favorite_recipes\`(\`id\`, \`user_id\`, \`recipe_id\`)
            VALUES(uuid(),?,?)`,
            [userId, recipe.recipeId]
        
      );
  
      return { code: 200, message: "Món ăn đã được thêm vào yêu thích!" };
    } catch (error) {
      console.error("Lỗi khi thêm yêu thích:", error);
      return { code: 500, message: "Đã có lỗi xảy ra khi thêm món ăn vào yêu thích!" };
    }
  }
  

  async function deleteFavoriteRecipe(userId, recipe) {
    try {
      if (!userId || !recipe.recipeId) {
        return { code: 400, message: "Thiếu userId hoặc recipeId!" };
      }
  
      // Kiểm tra nếu món ăn có trong danh sách yêu thích
      const [existingFavorite] = await db.execute(
        `SELECT * FROM favorite_recipes WHERE user_id = ? AND recipe_id = ?`,
        [userId, recipe.recipeId]
      );
  
      // Nếu món ăn không có trong danh sách yêu thích
      if (existingFavorite.length === 0) {
        return { code: 400, message: "Món ăn không tồn tại trong danh sách yêu thích!" };
      }
  
      // Nếu có, tiến hành xóa món ăn khỏi danh sách yêu thích
      await db.execute(
        `DELETE FROM favorite_recipes WHERE user_id = ? AND recipe_id = ?`,
        [userId, recipe.recipeId]
      );
  
      return { code: 200, message: "Đã xóa khỏi danh sách yêu thích!" };
    } catch (error) {
      console.error("Lỗi khi xóa yêu thích:", error);
      return { code: 500, message: "Đã có lỗi xảy ra khi xóa món ăn khỏi yêu thích!" };
    }
  }
  
  
module.exports = {
    getFavoriteRecipes,
    addFavoriteRecipe,
    deleteFavoriteRecipe
  };
  