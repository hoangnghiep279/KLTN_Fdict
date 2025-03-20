import React from "react";
import { food } from "../assets/img.js";
import { PiChefHatBold } from "react-icons/pi";
import { GiRiceCooker } from "react-icons/gi";
import { MdPeopleOutline } from "react-icons/md";
import { IoIosArrowForward } from "react-icons/io";
import { CiHeart } from "react-icons/ci";
import { FaHeart } from "react-icons/fa";
function Food() {
  let cssDesc = `flex items-center px-2 py-1 border border-[#ff8a4228] rounded-md text-sm`;
  return (
    <div className="w-[360px]">
      <div className="w-full h-[220px] overflow-hidden">
        <img
          src={food}
          alt=""
          className="w-full h-full rounded-xl object-cover"
        />
      </div>
      <div className="p-3">
        <p className="flex justify-between items-center">
          <span className="text-2xl font-semibold">Ốc xào khế</span>
          <span className={`${cssDesc}`}>
            1 <CiHeart className="ml-2 text-base" />
            {/* <FaHeart /> */}
          </span>
        </p>
        <p className="flex gap-3 items-center mt-3">
          <span className={`${cssDesc}`}>
            <MdPeopleOutline className="text-primaryColor mr-2 text-base" /> 4
            người
          </span>
          <span className={`${cssDesc}`}>
            {" "}
            <PiChefHatBold className="text-primaryColor mr-2 text-base" /> Dễ{" "}
          </span>
          <span className={`${cssDesc}`}>
            {" "}
            <GiRiceCooker className="text-primaryColor mr-2 text-base" /> 35
            phút
          </span>
        </p>
        <button className="css_button mt-4 px-3 h-10">
          Xem chi tiết <IoIosArrowForward />
        </button>
      </div>
    </div>
  );
}

export default Food;
