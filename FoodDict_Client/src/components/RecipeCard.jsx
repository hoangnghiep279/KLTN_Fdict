import React from "react";
import { FaMinusCircle } from "react-icons/fa";
import { Link } from "react-router-dom";
function RecipeCard({ id, name, image, onDelete }) {
  return (
    <div className="shadow-lg relative flex flex-col items-center p-3 rounded-lg bg-white w-32 h-32">
      <button className="absolute right-[-3px] top-[-2px]" onClick={onDelete}>
        <FaMinusCircle className="text-xl text-red-500" />
      </button>
      <Link to={`/detailRecipe/${id}`}>
        <div className="w-[100px] h-14 rounded-lg overflow-hidden">
          <img
            src={`http://localhost:3000/${image}`}
            alt={name}
            className="w-full h-full object-cover"
          />
        </div>
      </Link>
      <Link to={`/detailRecipe/${id}`}>
        <p className="text-xs mt-2 text-center font-semibold">{name}</p>
      </Link>
    </div>
  );
}

export default RecipeCard;
