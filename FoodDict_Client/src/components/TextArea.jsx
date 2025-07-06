import React from "react";

function TextArea({
  name,
  label,
  value,
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
      <textarea
        className="w-[80%] border p-2 bg-[#d3a48618] max-h-56 text-sm placeholder:text-gray-650  outline-none rounded-lg my-2 "
        id={name}
        name={name}
        placeholder={placeholder}
        value={value || ""}
        onChange={handleInput}
      />

      {isSubmitted && error?.[name] && (
        <p className="text-red-500 mt-2">{error[name]}</p>
      )}
    </div>
  );
}

export default TextArea;
