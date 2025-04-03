import React from "react";

function Input({
  name,
  label,
  value,
  type,
  placeholder,
  isSubmitted,
  error,
  handleInput,
}) {
  return (
    <div>
      <label htmlFor={name} className="text-base block">
        {label}:
      </label>
      <input
        className="w-[80%] p-2 bg-[#d3a48618] text-sm placeholder:text-gray-650 border-none outline-none rounded-lg my-2"
        id={name}
        name={name}
        type={type}
        placeholder={placeholder}
        value={type === "file" ? undefined : value || ""}
        onChange={handleInput}
      />
      {isSubmitted && error?.[name] && (
        <p className="text-red-500 mt-2">{error[name]}</p>
      )}
    </div>
  );
}

export default Input;
