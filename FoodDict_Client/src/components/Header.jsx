import React, { useState, useEffect } from "react";
import { NavLink, Link, useNavigate } from "react-router-dom";
import { logo } from "../assets/img";
import AuthModal from "../components/AuthModal";
import { FaFileSignature } from "react-icons/fa";
import { TbLogin } from "react-icons/tb";
import { FaUserCircle } from "react-icons/fa";
import { IoIosArrowDown } from "react-icons/io";

function Header() {
  const [isOpen, setIsOpen] = useState(false);
  const [isLogin, setIsLogin] = useState(true);
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem("token");
    setIsAuthenticated(!!token);
  }, []);

  const handleLogout = () => {
    localStorage.removeItem("token");
    setIsAuthenticated(false);
    window.location.reload()
  };

  return (
    <div className="box-shadow flex items-center justify-center fixed top-0 left-0 right-0 h-32">
      <ul className="flex gap-7 items-center container">
        <li>
          <NavLink
            to={`/`}
            className={({ isActive }) =>
              `font-bold text-nowrap ${isActive ? "text-primaryColor" : ""}`
            }
          >
            Thực đơn
          </NavLink>
        </li>
        <li>
          <NavLink className={`font-bold text-nowrap`}>
            Danh mục thực đơn
          </NavLink>
        </li>
        <li>
          <NavLink className={`font-bold text-nowrap`}>
            Thực đơn theo dinh dưỡng
          </NavLink>
        </li>
        <li>
          <Link
            to={"#"}
            className="w-24 h-24 rounded-full overflow-hidden block"
          >
            <img src={logo} alt="" className="w-full h-full rounded-full"></img>
          </Link>
        </li>
        <li>
          <NavLink className={`font-bold text-nowrap`}>Kế hoạch nấu ăn</NavLink>
        </li>
        <li>
          <NavLink className={`font-bold text-nowrap`}>Món yêu thích</NavLink>
        </li>
        {isAuthenticated ? (
          <li
            className="relative flex items-center gap-2 justify-between bg-[#ff8a42e0] py-1 w-40 px-1 rounded-full text-white font-bold whitespace-nowrap"
            onMouseEnter={() => setIsDropdownOpen(true)}
            onMouseLeave={() => setIsDropdownOpen(false)}
          >
            <FaUserCircle className="text-xl" />
            <span className="flex-1 overflow-hidden whitespace-nowrap">
              Hoàng văn nghiệp
            </span>
            <IoIosArrowDown className="text-xl" />
            {isDropdownOpen && (
              <ul className="absolute top-[33px] left-0 z-10 bg-white font-normal text-black rounded-lg shadow-lg p-4 min-w-[150px]">
                <li
                  className="py-2 px-4 hover:bg-gray-200 hover:text-primaryColor rounded-lg cursor-pointer"
                  onClick={() => navigate("/profile")}
                >
                  Tài khoản cá nhân
                </li>
                <li
                  className="py-2 px-4 hover:bg-gray-200 hover:text-primaryColor rounded-lg cursor-pointer"
                  onClick={handleLogout}
                >
                  Đăng xuất
                </li>
              </ul>
            )}
          </li>
        ) : (
          <li className="flex gap-7">
            <button
              className="css_button px-4 h-12 text-nowrap"
              onClick={() => {
                setIsOpen(true);
                setIsLogin(true);
              }}
            >
              Đăng nhập <TbLogin className="ml-2" />
            </button>
            <button
              className="css_button px-4 h-12 text-nowrap"
              onClick={() => {
                setIsOpen(true);
                setIsLogin(false);
              }}
            >
              Đăng ký <FaFileSignature className="ml-2" />
            </button>
          </li>
        )}
      </ul>
      <AuthModal
        isOpen={isOpen}
        onClose={() => setIsOpen(false)}
        isLogin={isLogin}
        setIsLogin={setIsLogin}
      />
    </div>
  );
}

export default Header;
