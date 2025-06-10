const db = require("../config/database");

async function getCommentsByRecipe(recipeId) {
  try {
    const [comments] = await db.query(
      `SELECT comment.id, comment.user_id, user.name, user.avatar, comment.recipe_id, comment.content, comment.created_at 
         FROM comment 
         JOIN user ON comment.user_id = user.id 
         WHERE recipe_id = ? 
         ORDER BY created_at DESC`,
      [recipeId]
    );
    return {
      code: 200,
      data: comments,
    };
  } catch (error) {
    throw error;
  }
}

// async function getAllCommentsForAdmin(page = 1, limit = 10) {
//   try {
//     const offset = (page - 1) * limit;

//     const [comments] = await db.query(
//       `SELECT
//          comment.id,
//          comment.user_id,
//          user.name AS user_name,
//          user.avatar,
//          comment.recipe_id,
//          recipes.name AS recipe_name,
//          comment.content,
//          comment.created_at
//        FROM comment
//        JOIN user ON comment.user_id = user.id
//        JOIN recipes ON comment.recipe_id = recipes.id
//        ORDER BY comment.created_at DESC
//        LIMIT ? OFFSET ?`,
//       [limit, offset]
//     );

//     // Lấy tổng số bình luận (cho frontend biết có bao nhiêu trang)
//     const [totalResult] = await db.query(
//       `SELECT COUNT(*) AS total FROM comment`
//     );
//     const total = totalResult[0].total;

//     return {
//       code: 200,
//       data: comments,
//       pagination: {
//         page,
//         limit,
//         total,
//         totalPages: Math.ceil(total / limit),
//       },
//     };
//   } catch (error) {
//     throw error;
//   }
// }
async function searchCommentsForAdmin(page = 1, limit = 10, search = "") {
  try {
    const offset = (page - 1) * limit;

    const query = `
      SELECT 
        comment.id, 
        comment.user_id, 
        user.name AS user_name, 
        user.avatar, 
        comment.recipe_id, 
        recipes.name AS recipe_name,
        comment.content, 
        comment.created_at 
      FROM comment 
      JOIN user ON comment.user_id = user.id
      JOIN recipes ON comment.recipe_id = recipes.id
      WHERE user.name LIKE ? OR comment.content LIKE ? OR recipes.name LIKE ?
      ORDER BY comment.created_at DESC
      LIMIT ? OFFSET ?
    `;

    const searchPattern = `%${search}%`;

    const [comments] = await db.query(query, [
      searchPattern,
      searchPattern,
      searchPattern,
      limit,
      offset,
    ]);

    const [countResult] = await db.query(
      `
      SELECT COUNT(*) AS total 
      FROM comment 
      JOIN user ON comment.user_id = user.id
      JOIN recipes ON comment.recipe_id = recipes.id
      WHERE user.name LIKE ? OR comment.content LIKE ? OR recipes.name LIKE ?
      `,
      [searchPattern, searchPattern, searchPattern]
    );

    const total = countResult[0].total;

    return {
      code: 200,
      data: {
        comments,
        total,
        currentPage: page,
        totalPages: Math.ceil(total / limit),
      },
    };
  } catch (error) {
    throw error;
  }
}

// Thêm bình luận mới
async function addComment(user_id, comment) {
  try {
    if (!user_id || !comment.recipe_id || !comment.content?.trim()) {
      return { code: 400, message: "Thiếu thông tin bình luận" };
    }

    const [result] = await db.query(
      `INSERT INTO comment (id, user_id, recipe_id, content) VALUES (uuid(),?, ?, ?)`,
      [user_id, comment.recipe_id, comment.content]
    );

    return {
      code: 201,
      message: "Thêm bình luận thành công",
      commentId: result.insertId,
    };
  } catch (error) {
    throw error;
  }
}

async function deleteComment(user_id, comment_id) {
  try {
    if (!comment_id || !user_id) {
      return { code: 400, message: "Thiếu thông tin để xóa bình luận" };
    }

    // Chỉ cho phép xóa nếu là chủ bình luận
    const [check] = await db.query(
      `SELECT * FROM comment WHERE id = ? AND user_id = ?`,
      [comment_id, user_id]
    );

    if (check.length === 0) {
      return { code: 403, message: "Bạn không có quyền xóa bình luận này" };
    }

    await db.query(`DELETE FROM comment WHERE id = ?`, [comment_id]);

    return { code: 200, message: "Xóa bình luận thành công" };
  } catch (error) {
    throw error;
  }
}

async function updateComment(user_id, comment_id, newContent) {
  try {
    if (!comment_id || !newContent?.trim()) {
      return { code: 400, message: "Thiếu nội dung hoặc ID bình luận" };
    }

    // Kiểm tra quyền sửa
    const [check] = await db.query(
      `SELECT * FROM comment WHERE id = ? AND user_id = ?`,
      [comment_id, user_id]
    );

    if (check.length === 0) {
      return { code: 403, message: "Bạn không có quyền sửa bình luận này" };
    }

    await db.query(`UPDATE comment SET content = ? WHERE id = ?`, [
      newContent,
      comment_id,
    ]);

    return { code: 200, message: "Cập nhật bình luận thành công" };
  } catch (error) {
    throw error;
  }
}

async function deleteCommentById(commentId) {
  try {
    const [result] = await db.query("DELETE FROM comment WHERE id = ?", [
      commentId,
    ]);

    if (result.affectedRows === 0) {
      return {
        code: 404,
        message: "Không tìm thấy bình luận để xóa.",
      };
    }

    return {
      code: 200,
      message: "Xóa bình luận thành công.",
    };
  } catch (error) {
    throw error;
  }
}

module.exports = {
  getCommentsByRecipe,
  // getAllCommentsForAdmin,
  searchCommentsForAdmin,
  addComment,
  deleteComment,
  updateComment,
  deleteCommentById,
};
