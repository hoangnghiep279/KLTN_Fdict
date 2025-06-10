import React from "react";

const Pagination = ({ page, totalPages, setPage, limit, setLimit }) => {
  const pageNumbers = [];
  const maxPageToShow = 3;

  for (let i = 1; i <= totalPages; i++) {
    if (i <= maxPageToShow || i === totalPages || i === page) {
      pageNumbers.push(i);
    } else if (
      i === page - 1 ||
      i === page + 1 ||
      (page >= totalPages - 2 && i > totalPages - 3)
    ) {
      pageNumbers.push(i);
    } else if (!pageNumbers.includes("...")) {
      pageNumbers.push("...");
    }
  }

  const handleLimitChange = (e) => {
    setLimit(Number(e.target.value));
    setPage(1);
  };

  const handlePageInput = (e) => {
    const newPage = Number(e.target.value);
    if (!isNaN(newPage) && newPage >= 1 && newPage <= totalPages) {
      setPage(newPage);
    }
  };

  return (
    <div className="flex items-center gap-4 mt-4 w-[85%]">
      <select
        className="border p-1 rounded"
        value={limit}
        onChange={handleLimitChange}
      >
        {[2, 5, 10, 12, 20, 50].map((val) => (
          <option key={val} value={val}>
            {val} / trang
          </option>
        ))}
      </select>
      <span>Chuyển đến</span>
      <input
        type="number"
        min="1"
        max={totalPages}
        className="w-14 border rounded px-2 py-1"
        value={page}
        onChange={handlePageInput}
      />

      <div className="flex gap-2 ml-auto">
        <button
          onClick={() => page > 1 && setPage(page - 1)}
          disabled={page === 1}
          className="px-2 py-1 border rounded disabled:opacity-50"
        >
          &lt;
        </button>
        {pageNumbers.map((num, index) =>
          num === "..." ? (
            <span key={index} className="px-2 py-1 text-gray-500">
              ...
            </span>
          ) : (
            <button
              key={num}
              onClick={() => setPage(num)}
              className={`px-3 py-1 border rounded ${
                num === page ? "bg-red-100 border-red-500 text-red-600" : ""
              }`}
            >
              {num}
            </button>
          )
        )}
        <button
          onClick={() => page < totalPages && setPage(page + 1)}
          disabled={page === totalPages}
          className="px-2 py-1 border rounded disabled:opacity-50"
        >
          &gt;
        </button>
      </div>
    </div>
  );
};

export default Pagination;
