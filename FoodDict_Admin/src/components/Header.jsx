import React, { useState } from "react";
import { NavLink, useNavigate } from "react-router-dom";
import { setting } from "../assets/img.js";
import { IoFastFoodOutline } from "react-icons/io5";
import { IoIosArrowForward } from "react-icons/io";
import { BiCategory } from "react-icons/bi";
import { LuUserRoundCog } from "react-icons/lu";

function Header() {
  const navigate = useNavigate();
  const [openDropdown, setOpenDropdown] = useState(null);

  // Danh sách các mục với link con
  const menuItems = [
    {
      title: "Quản lý công thức món ăn",
      icon: <IoFastFoodOutline className="mr-2 text-2xl" />,
      links: [
        {
          name: "Thêm công thức",
          to: "#",
          // "/them-cong-thuc"
        },
        {
          name: "Sửa công thức",
          to: "#",
          // "/sua-cong-thuc"
        },
        {
          name: "Xóa công thức",
          to: "#",
          // "/xoa-cong-thuc"
        },
      ],
    },
    {
      title: "Quản lý danh mục",
      icon: <BiCategory className="mr-2 text-2xl" />,
      links: [
        {
          name: "Danh mục nguyên liệu",
          to: "#",
          // "/danh-muc-nguyen-lieu"
        },
        {
          name: "Danh mục chế biến",
          to: "#",
          // "/danh-muc-che-bien"
        },
        {
          name: "Danh mục theo nhu cầu dinh dưỡng",
          to: "#",
          // "/danh-muc-dinh-duong",
        },
        {
          name: "Danh mục buổi ăn",
          to: "#",
          // "/danh-muc-buoi-an"
        },
      ],
    },
  ];

  // Xử lý khi click vào một mục
  const handleClick = (index, firstLink) => {
    if (openDropdown === index) {
      setOpenDropdown(null); // Đóng nếu đã mở
    } else {
      setOpenDropdown(index); // Mở dropdown
      navigate(firstLink); // Điều hướng đến link đầu tiên
    }
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
              onClick={() => handleClick(index, item.links[0].to)}
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
                  className="flex flex-col gap-3 text-sm hover:bg-[#5932EA] hover:text-white p-2 rounded-lg"
                >
                  <NavLink to={link.to}>{link.name}</NavLink>
                </li>
              ))}
            </ul>
          </li>
        ))}

        <li className="flex items-center px-2 py-2 cursor-pointer hover:bg-[#5932EA] hover:text-white rounded-lg">
          <LuUserRoundCog className="mr-2 text-2xl" />
          Quản lý người dùng
        </li>
      </ul>
    </div>
  );
}

export default Header;
