import axios from "axios";
import { useState, useEffect } from "react";

const CheckboxGroup = ({ apiUrl, title, selectedItems, setSelectedItems }) => {
  const [items, setItems] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(apiUrl);
        setItems(response.data.data);
      } catch (error) {
        console.error(`Lỗi khi lấy ${title}:`, error);
      }
    };

    fetchData();
  }, [apiUrl]);

  const handleCheckboxChange = (id) => {
    setSelectedItems((prev) => {
      const prevArray = Array.isArray(prev) ? prev : []; // Đảm bảo luôn là mảng
      return prevArray.includes(id)
        ? prevArray.filter((item) => item !== id)
        : [...prevArray, id];
    });
  };

  return (
    <div className="mt-3">
      <h3 className="text-lg font-semibold text-gray-800 mb-2">{title}</h3>
      <div className="grid grid-cols-3 gap-2">
        {items.map((item) => (
          <label
            key={item.id}
            className="flex items-center space-x-2 bg-gray-100 p-2 rounded-lg cursor-pointer hover:bg-gray-200 transition"
          >
            <input
              type="checkbox"
              id={item.id}
              checked={
                Array.isArray(selectedItems) && selectedItems.includes(item.id)
              } // Kiểm tra nếu selectedItems là mảng
              onChange={() => handleCheckboxChange(item.id)}
              className="w-4 h-4 text-blue-600 border-gray-300 rounded focus:ring-blue-500"
            />
            <span className="text-gray-700">{item.name}</span>
          </label>
        ))}
      </div>
    </div>
  );
};

export default CheckboxGroup;
