import React from "react";

const TextWithLineBreaks = ({ text, styleCss = "" }) => {
  return (
    <ul className={`${styleCss} mt-3`}>
      {text
        ?.split("\n")
        .map((paragraph, index) =>
          paragraph.trim() ? (
            <li key={index}>{paragraph}</li>
          ) : (
            <br key={index} />
          )
        )}
    </ul>
  );
};

export default TextWithLineBreaks;
