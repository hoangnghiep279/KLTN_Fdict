import React, { useState } from "react";
import { Link } from "react-router-dom";
import { Validation } from "../utils/validation";
import registerUser from "../api/users/signup.js";
const SignUp = ({ setIsLogin, onClose }) => {
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [error, setError] = useState({});
  const [values, setValue] = useState({
    name: "",
    email: "",
    password: "",
    gender: "",
    birthday: "",
  });
  const handleInput = (e) => {
    const { name, value } = e.target;
    setValue((prevValues) => ({ ...prevValues, [name]: value }));

    if (isSubmitted) {
      setError((prevErrors) => ({
        ...prevErrors,
        [name]: Validation({ ...values, [name]: value }, [name])[name],
      }));
    }
  };
  const handleSignUp = async (e) => {
    e.preventDefault();
    setIsSubmitted(true);

    const validationErrors = Validation(values, [
      "name",
      "email",
      "password",
      "confirmPassword",
      "gender",
      "birthday",
    ]);
    setError(validationErrors);

    if (Object.keys(validationErrors).length > 0) {
      return;
    }

    registerUser(values, setError, setIsLogin);
  };
  let cssInput =
    "w-full p-3 bg-[#ff8a4218] placeholder:text-gray-650 border-none outline-none rounded-lg my-2";
  return (
    <div className="bg-secondColor px-6 pb-6 rounded-[2rem] shadow-lg w-2/4 relative z-10 h-[40rem] overflow-y-scroll no-scrollbar">
      <div className="flex justify-between items-center sticky top-0 py-3 bg-secondColor">
        <h2 className="text-4xl font-extrabold ">Tạo tài khoản</h2>
        <button
          className="absolute top-2 right-3 text-5xl text-red-500 font-light "
          onClick={onClose}
        >
          &times;
        </button>
      </div>
      <p className="text-thirdColor ml-5 my-5 font-semibold">
        Ấn{" "}
        <button
          onClick={() => setIsLogin(true)}
          className="text-primaryColor font-bold underline italic"
        >
          đăng nhập
        </button>{" "}
        nếu bạn chưa có tài khoản
      </p>
      <form onSubmit={handleSignUp}>
        <div className="mb-4">
          <label htmlFor="name" className="text-lg mb-2 block">
            Họ tên
          </label>
          <input
            onChange={handleInput}
            className={`${cssInput}`}
            type="text"
            name="name"
            id="name"
            placeholder="Họ tên của bạn"
          />
          {isSubmitted && error.name && (
            <p className="text-red-500 mt-2">{error.name}</p>
          )}
        </div>
        <div className="mb-4">
          <label htmlFor="email" className="text-lg mb-2 block">
            Email
          </label>
          <input
            onChange={handleInput}
            className={`${cssInput}`}
            type="email"
            name="email"
            id="email"
            placeholder="Nhập email"
          />
          {isSubmitted && error.email && (
            <p className="text-red-500 mt-2">{error.email}</p>
          )}
        </div>
        <div className="mb-4">
          <label htmlFor="birthday" className="text-lg mb-2 block">
            Ngày sinh
          </label>
          <input
            onChange={handleInput}
            className={`${cssInput}`}
            id="birthday"
            type="text"
            name="birthday"
            placeholder="mm/dd/yyyy"
          />
          <li> Ví dụ: 09/25/1999</li>
          {isSubmitted && error.birthday && (
            <p className="text-red-500 mt-2">{error.birthday}</p>
          )}
        </div>
        <div className="mb-4">
          <label htmlFor="gender" className="text-lg mb-2 block">
            Giới tính
          </label>
          <select
            className="w-full p-3 bg-[#ff8a4218] font-bold placeholder:text-gray-650 border-none outline-none rounded-lg my-2"
            name="gender"
            id="gender"
            onChange={handleInput}
          >
            <option value="">Chọn giới tính</option>
            <option value="1">Nam</option>
            <option value="2">Nữ</option>
          </select>
          {isSubmitted && error.gender && (
            <p className="text-red-500 mt-2">{error.gender}</p>
          )}
        </div>
        <div className="mb-4">
          <label htmlFor="password" className="text-lg mb-2 block">
            Mật khẩu
          </label>
          <input
            onChange={handleInput}
            className={`${cssInput}`}
            id="password"
            type="password"
            name="password"
            placeholder="Nhập mật khẩu"
          />
          <li> Tối thiểu 6 ký tự</li>
          <li> Bao gồm chữ thường, chữ in hoa và số</li>
          {isSubmitted && error.password && (
            <p className="text-red-500 mt-2">{error.password}</p>
          )}
        </div>
        <div className="mb-4">
          <label htmlFor="repass" className="text-lg mb-2 block">
            Nhập Lại Mật Khẩu
          </label>
          <input
            onChange={handleInput}
            className={`${cssInput}`}
            id="repass"
            type="password"
            name="confirmPassword"
            placeholder="Nhập lại mật khẩu"
          />
          {isSubmitted && error.confirmPassword && (
            <p className="text-red-500 mt-2">{error.confirmPassword}</p>
          )}
        </div>
        <button
          type="submit"
          className="w-full bg-thirdColor text-white py-3 rounded-lg mt-4"
        >
          Đăng nhập
        </button>
      </form>
      <div className="flex justify-between">
        <Link
          to={"#"}
          className="text-thirdColor text-lg mt-5 block font-semibold"
        >
          Lấy lại mật khẩu
        </Link>
      </div>
    </div>
  );
};

export default SignUp;
