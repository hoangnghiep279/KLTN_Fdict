const phoneRegex = /(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/;
function Validation(values, fields = []) {
  const error = {};

  const emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
  const birthdayRegex = /^(0[1-9]|1[0-2])\/(0[1-9]|[12][0-9]|3[01])\/\d{4}$/;
  // Validate email
  if (fields.includes("email")) {
    if (!values.email || values.email.trim() === "") {
      error.email = "Vui lòng nhập email";
    } else if (!emailRegex.test(values.email)) {
      error.email = "Email không hợp lệ";
    }
  }

  // Validate password
  if (fields.includes("password")) {
    if (!values.password || values.password.trim() === "") {
      error.password = "Vui lòng nhập mật khẩu";
    } else if (values.password.length < 6) {
      error.password = "Mật khẩu phải ít nhất 6 ký tự";
    }
  }

  // Validate name
  if (fields.includes("name")) {
    if (!values.name || values.name.trim() === "") {
      error.name = "Vui lòng nhập tên của bạn";
    }
  }

  // Validate confirmPassword
  if (fields.includes("confirmPassword")) {
    if (!values.confirmPassword || values.confirmPassword.trim() === "") {
      error.confirmPassword = "Vui lòng xác nhận lại mật khẩu";
    } else if (values.confirmPassword !== values.password) {
      error.confirmPassword = "Mật khẩu không khớp nhau";
    }
  }
  if (fields.includes("birthday")) {
    if (!values.birthday || values.birthday.trim() === "") {
      error.birthday = "Vui lòng nhập ngày sinh";
    } else if (!birthdayRegex.test(values.birthday)) {
      error.birthday = "Ngày sinh không đúng định dạng MM/DD/YYYY";
    }
  }

  // Validate gender (1 = Nam, 2 = Nữ)
  if (fields.includes("gender")) {
    const genderValue = Number(values.gender); // Chuyển về kiểu số
    if (!genderValue) {
      error.gender = "Vui lòng chọn giới tính";
    } else if (![1, 2].includes(genderValue)) {
      error.gender = "Giới tính không hợp lệ";
    }
  }

  return error;
}
function validateRecipe(values, fields = []) {
  const errors = {};
  const numberRegex = /^[0-9]+$/; // Chỉ chấp nhận số nguyên dương
  // Validate name
  if (fields.includes("name")) {
    if (!values.name.trim()) {
      errors.name = "Vui lòng nhập tên món ăn";
    }
  }

  // Validate img_url
  if (fields.includes("img_url")) {
    if (!values.img_url) {
      errors.img_url = "Vui lòng chọn ảnh";
    }
  }
  if (fields.includes("img_nutrition")) {
    if (!values.img_nutrition) {
      errors.img_nutrition = "Vui lòng chọn ảnh";
    }
  }

  // Validate số (serving_size, cooking_time, calories)
  if (fields.includes("serving_size")) {
    if (!values.serving_size.trim()) {
      errors.serving_size = "Vui lòng nhập khẩu phần ăn";
    } else if (!numberRegex.test(values.serving_size)) {
      errors.serving_size = "Khẩu phần ăn phải là số nguyên";
    }
  }

  if (fields.includes("cooking_time")) {
    if (!values.cooking_time.trim()) {
      errors.cooking_time = "Vui lòng nhập thời gian nấu";
    }
  }

  if (fields.includes("calories")) {
    if (!values.calories.trim()) {
      errors.calories = "Vui lòng nhập số calo";
    } else if (!numberRegex.test(values.calories)) {
      errors.calories = "Calo phải là số nguyên";
    }
  }

  if (fields.includes("difficulty")) {
    const difficultyValue = Number(values.difficulty);
    if (isNaN(difficultyValue)) {
      errors.difficulty = "Vui lòng nhập độ khó hợp lệ";
    } else if (![1, 2, 3].includes(difficultyValue)) {
      errors.difficulty = "Mức độ khó chỉ có thể là 1, 2 hoặc 3";
    }
  }

  // Validate description
  if (fields.includes("description")) {
    if (!values.description.trim()) {
      errors.description = "Vui lòng nhập mô tả";
    }
  }

  // Validate preparation
  if (fields.includes("preparation")) {
    if (!values.preparation.trim()) {
      errors.preparation = "Vui lòng nhập cách chuẩn bị";
    }
  }

  // Validate instructions
  if (fields.includes("instructions")) {
    if (!values.instructions.trim()) {
      errors.instructions = "Vui lòng nhập hướng dẫn nấu ăn";
    }
  }

  // Validate usagefood
  if (fields.includes("usagefood")) {
    if (!values.usagefood.trim()) {
      errors.usagefood = "Vui lòng nhập cách sử dụng thực phẩm";
    }
  }

  // Validate tips
  if (fields.includes("tips")) {
    if (!values.tips.trim()) {
      errors.tips = "Vui lòng nhập mẹo nấu ăn";
    }
  }

  // Validate expert_advice
  if (fields.includes("expert_advice")) {
    if (!values.expert_advice.trim()) {
      errors.expert_advice = "Vui lòng nhập lời khuyên từ chuyên gia";
    }
  }
  if (fields.includes("mealTypesId") && values.mealTypesId.length === 0) {
    errors.mealTypesId = "Vui lòng chọn loại món ăn";
  }
  if (
    fields.includes("cookingMethodsId") &&
    values.cookingMethodsId.length === 0
  ) {
    errors.cookingMethodsId = "Vui lòng chọn phương pháp nấu ăn";
  }

  if (fields.includes("mealCateId") && values.mealCateId.length === 0) {
    errors.mealCateId = "Vui lòng chọn loại bữa ăn";
  }

  return errors;
}

export { Validation, validateRecipe };
