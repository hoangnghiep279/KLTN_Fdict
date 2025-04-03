import React, { useState } from "react";
import { Link } from "react-router-dom";
import { Validation } from "../utils/validation";
import loginUser from "../api/users/login.js";
const SignIn = ({ setIsLogin, onClose }) => {
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [error, setError] = useState({});
  const [values, setValue] = useState({
    email: "",
    password: "",
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

  const handleLogin = async (e) => {
    e.preventDefault();
    setIsSubmitted(true);
    const validationErrors = Validation(values, ["email", "password"]);
    setError(validationErrors);
    if (Object.keys(validationErrors).length > 0) {
      return;
    }

    loginUser(values, setError);
  };

  return (
    <div className="bg-secondColor p-6 rounded-[2rem] shadow-lg w-2/4 relative z-10 ">
      <div className="flex justify-between items-center sticky top-0 py-3 bg-secondColor">
        <h2 className="text-4xl font-extrabold ">Đăng Nhập</h2>
        <button
          className="absolute top-2 right-3 text-5xl text-red-500 font-light "
          onClick={onClose}
        >
          &times;
        </button>
      </div>
      <p className="text-gray-600  my-4">Khám phá nhiều món ăn hấp dẫn,</p>
      <form onSubmit={handleLogin}>
        <div className="mb-4">
          <label htmlFor="email" className="text-lg mb-2 block">
            ✨ Tài khoản Email của bạn
          </label>
          <input
            className="w-full p-3 bg-[#ff8a4218] placeholder:text-gray-650 border-none outline-none rounded-lg my-2"
            type="email"
            name="email"
            id="email"
            placeholder="Vui lòng nhập thông tin tài khoản"
            onChange={handleInput}
          />
          {isSubmitted && error.email && (
            <p className="text-red-500 mt-2">{error.email}</p>
          )}
        </div>
        <div className="mb-4">
          <label htmlFor="password" className="text-lg mb-2 block">
            ✨ Mật khẩu
          </label>
          <input
            className="w-full p-3 bg-[#ff8a4218] placeholder:text-gray-650 border-none outline-none rounded-lg my-2"
            type="password"
            name="password"
            id="password"
            placeholder="Nhập mật khẩu"
            onChange={handleInput}
          />
          {isSubmitted && error.password && (
            <p className="text-red-500 mt-2">{error.password}</p>
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
        <p className="text-thirdColor  mt-5 font-semibold">
          Ấn{" "}
          <button
            onClick={() => setIsLogin(false)}
            className="text-primaryColor font-bold underline italic"
          >
            đăng ký
          </button>{" "}
          nếu bạn chưa có tài khoản
        </p>
      </div>
    </div>
  );
};

export default SignIn;
