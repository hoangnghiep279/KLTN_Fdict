import React from "react";
import { FaMinusCircle } from "react-icons/fa";
import { food } from "../assets/img";
function RecipeCard({ name, image, onDelete }) {
  return (
    <div className="shadow-lg relative flex flex-col items-center p-3 rounded-lg bg-white w-32 h-32">
      <button className="absolute right-[-3px] top-[-2px]" onClick={onDelete}>
        <FaMinusCircle className="text-xl text-red-500" />
      </button>
      <div className="w-[100px] h-14 rounded-lg overflow-hidden">
        <img
          src={`http://localhost:3000/${image}`}
          alt={name}
          className="w-full h-full object-cover"
        />
      </div>
      <p className="text-xs mt-2 text-center font-semibold">{name}</p>
    </div>
  );
}

export default RecipeCard;
