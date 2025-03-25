import React, { useState, useEffect } from "react";
import { banner } from "../assets/img";
import { IoIosSearch } from "react-icons/io";
import { FaFilter } from "react-icons/fa6";
import { FaArrowRight } from "react-icons/fa";
import Food from "../components/Food";
import Loading from "../components/Loading";
import fetchRecipes from "../api/recipes/getRecipe";
function Home() {
  const [recipes, setRecipes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(1);
  const [limit, setLimit] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  console.log(recipes);
  useEffect(() => {
    fetchRecipes(setRecipes, setTotalPages, setLoading, page, limit);
  }, [page]);
  const handleSearch = () => {
    console.log("faskjdf");
  };
  if (loading) return <Loading />;
  return (
    <div className="container">
      <video src={banner} autoPlay loop muted className="rounded-3xl "></video>
      <div className="w-2/5 mx-auto box-shadow border-4 rounded-2xl absolute top-[25rem] left-1/2 -translate-x-1/2 border-[#FDE7E8] p-4">
        <p className="text-center text-xl italic font-bold">
          100 công thức ngon và dễ làm
        </p>
        <form
          onSubmit={handleSearch}
          className="w-full flex items-center gap-3 justify-between mt-5"
        >
          <div className="flex items-center hover:border-primaryColor border px-3 h-11 bg-[#66666611] w-full rounded-md ">
            <label htmlFor="search">
              <IoIosSearch className="text-2xl" />
            </label>
            <input
              id="search"
              type="text"
              placeholder="Tìm kiếm"
              className="ml-2 default-input w-full"
            />
            <FaFilter className="ml-auto text-xl cursor-pointer" />
          </div>
          <button
            type="submit"
            className="bg-primaryColor h-11 w-16 css_button"
          >
            <FaArrowRight className="" />
          </button>
        </form>
      </div>
      <section className="mt-40">
        <h2 className="text-4xl font-extrabold text-center">Thực đơn</h2>
        <div className="mt-10 flex justify-between">
          {recipes.length > 0 ? (
            recipes.map((recipe) => <Food key={recipe.id} recipe={recipe} />)
          ) : (
            <p>Không có công thức nào!</p>
          )}
        </div>
      </section>
    </div>
  );
}

export default Home;
