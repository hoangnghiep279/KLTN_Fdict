import React, { useState, useEffect } from "react";
import { banner } from "../assets/img";
import { IoIosSearch } from "react-icons/io";
import { FaFilter } from "react-icons/fa6";
import { FaArrowRight } from "react-icons/fa";
import Food from "../components/Food";
import Loading from "../components/Loading";
import { fetchRecipes } from "../api/recipes/getRecipe";
import FilterPanel from "../components/FilterPanel";
import searchRecipes from "../api/recipes/searchRecipes";
import Pagination from "../components/Pagination";
import { fetchRecipesWithFavoriteStatus } from "../api/recipes/getRecipewithFav";

function Home() {
  const [recipes, setRecipes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [page, setPage] = useState(1);
  const [limit, setLimit] = useState(20);
  const [totalPages, setTotalPages] = useState(1);
  const [showFilterPanel, setShowFilterPanel] = useState(false);
  const [keyword, setKeyword] = useState("");
  const [sortType, setSortType] = useState("all");
  const token = localStorage.getItem("token");
  const [selectedFilters, setSelectedFilters] = useState({
    dinh_duong: [],
    nguyen_lieu: [],
    cach_nau: [],
    loai_bua_an: [],
    danh_muc_mon_an: [],
  });

  const handleFilterChange = (updatedFilters) => {
    setSelectedFilters(updatedFilters);
  };

  useEffect(() => {
    const fetchFilteredRecipes = async () => {
      setLoading(true);
      try {
        const isLoggedIn = !!localStorage.getItem("token");

        if (
          selectedFilters.dinh_duong.length ||
          selectedFilters.nguyen_lieu.length ||
          selectedFilters.cach_nau.length ||
          selectedFilters.loai_bua_an.length ||
          selectedFilters.danh_muc_mon_an.length
        ) {
          const res = await searchRecipes({
            ...selectedFilters,
            keyword,
            page,
            limit,
          });
          setRecipes(res.data);
          setTotalPages(res.totalPages);
        } else {
          if (isLoggedIn) {
            await fetchRecipesWithFavoriteStatus(
              setRecipes,
              setTotalPages,
              setLoading,
              page,
              limit,
              token,
              sortType
            );
          } else {
            await fetchRecipes(
              setRecipes,
              setTotalPages,
              setLoading,
              page,
              limit,
              sortType
            );
          }
        }
      } catch (err) {
        console.error("Lỗi khi lấy công thức:", err);
      } finally {
        setLoading(false);
      }
    };

    fetchFilteredRecipes();
  }, [selectedFilters, page, limit, sortType]);

  const handleSearch = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const res = await searchRecipes({
        ...selectedFilters,
        keyword,
        page,
        limit,
      });
      setRecipes(res.data);
      setTotalPages(res.totalPages);
    } catch (err) {
      console.error("Lỗi khi tìm kiếm:", err);
    } finally {
      setLoading(false);
    }
  };

  if (loading) return <Loading />;

  return (
    <div className="container pb-16">
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
              value={keyword}
              onChange={(e) => setKeyword(e.target.value)}
              className="ml-2 default-input w-full"
            />
            <FaFilter
              className="ml-auto text-xl cursor-pointer"
              onClick={() => setShowFilterPanel(!showFilterPanel)}
            />
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
        {showFilterPanel && (
          <div className="w-3/5 mx-auto mt-5">
            <FilterPanel
              selectedFilters={selectedFilters}
              onFilterChange={handleFilterChange}
            />
          </div>
        )}
        <h2 className="text-4xl font-extrabold text-center">Thực đơn</h2>
        <select
          onChange={(e) => {
            setSortType(e.target.value);
            setPage(1);
          }}
          value={sortType}
          className="mt-4 border-2 px-3 py-2 rounded-md ml-auto block "
        >
          <option value="all">Tất cả</option>
          <option value="favorite">Yêu thích nhiều nhất</option>
          <option value="popular">Phổ biến</option>
          <option value="newest">Mới nhất</option>
        </select>

        <div className="mt-10 flex items-center gap-8 flex-wrap">
          {recipes.length > 0 ? (
            recipes.map((recipe) => <Food key={recipe.id} recipe={recipe} />)
          ) : (
            <p>Không có công thức nào!</p>
          )}
        </div>
      </section>

      <Pagination
        page={page}
        totalPages={totalPages}
        setPage={setPage}
        limit={limit}
        setLimit={setLimit}
      />
    </div>
  );
}

export default Home;
