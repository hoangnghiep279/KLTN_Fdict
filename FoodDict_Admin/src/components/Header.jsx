import React, { useState, useEffect } from "react";
import { NavLink, useNavigate, useLocation } from "react-router-dom";
import { setting } from "../assets/img.js";
import { IoFastFoodOutline } from "react-icons/io5";
import { IoIosArrowForward } from "react-icons/io";
import { BiCategory } from "react-icons/bi";
import { LuUserRoundCog } from "react-icons/lu";

function Header() {
  const navigate = useNavigate();
  const location = useLocation();
  const [openDropdown, setOpenDropdown] = useState(null);

  const menuItems = [
    {
      title: "Quản lý công thức món ăn",
      icon: <IoFastFoodOutline className="mr-2 text-2xl" />,
      links: [
        { name: "Danh sách công thức", to: "/" },
        { name: "Thêm công thức", to: "/insertRecipe" },
      ],
    },
    {
      title: "Quản lý danh mục",
      icon: <BiCategory className="mr-2 text-2xl" />,
      links: [
        { name: "Danh mục nguyên liệu", to: "/ingredients" },
        { name: "Danh mục chế biến", to: "/cookingMethods" },
        { name: "Danh mục theo nhu cầu dinh dưỡng", to: "/nutritionNeeds" },
        { name: "Danh mục buổi ăn", to: "/mealTypes" },
      ],
    },
  ];

  // Kiểm tra nếu đường dẫn hiện tại thuộc danh mục nào thì mở dropdown đó
  useEffect(() => {
    const activeIndex = menuItems.findIndex((item) =>
      item.links.some((link) => link.to === location.pathname)
    );
    setOpenDropdown(activeIndex !== -1 ? activeIndex : null);
  }, [location.pathname]);

  const handleClick = (index) => {
    setOpenDropdown(openDropdown === index ? null : index);
  };

  return (
    <div className="box-shadow fixed top-0 left-0 w-80 h-screen p-5">
      <h1 className="text-3xl font-bold mt-5 flex-center">
        <img src={setting} alt="" />
        <span className="ml-2"> Quản trị</span>
      </h1>

      <ul className="mt-16 text-[#9197B3] flex flex-col gap-10">
        {menuItems.map((item, index) => (
          <li key={index}>
            <span
              className="flex items-center cursor-pointer p-2 hover:bg-[#5932EA] hover:text-white rounded-lg"
              onClick={() => handleClick(index)}
            >
              {item.icon}
              {item.title}
              <IoIosArrowForward
                className={`mt-1 ml-auto transition-transform ${
                  openDropdown === index ? "rotate-90" : ""
                }`}
              />
            </span>
            <ul
              className={openDropdown === index ? "block ml-8 mt-3" : "hidden"}
            >
              {item.links.map((link, i) => (
                <li
                  key={i}
                  className={`flex flex-col gap-3 text-sm p-2 rounded-lg
                    ${
                      location.pathname === link.to
                        ? "font-bold text-white bg-[#5932EA]"
                        : "hover:bg-[#5932EA] hover:text-white"
                    }
                  `}
                >
                  <NavLink to={link.to}>{link.name}</NavLink>
                </li>
              ))}
            </ul>
          </li>
        ))}

        <li
          className={`flex items-center px-2 py-2 cursor-pointer rounded-lg 
            ${
              location.pathname === "/user-management"
                ? "font-bold text-white bg-[#5932EA]"
                : "hover:bg-[#5932EA] hover:text-white"
            }
          `}
        >
          <LuUserRoundCog className="mr-2 text-2xl" />
          Quản lý người dùng
        </li>
      </ul>
    </div>
  );
}

export default Header;
