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

export { Validation };
