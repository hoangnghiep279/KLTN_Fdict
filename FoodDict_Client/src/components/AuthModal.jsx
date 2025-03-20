import React, { useState } from "react";
import SignIn from "./SignIn";
import SignUp from "./SignUp";

const AuthModal = ({ isOpen, onClose, isLogin, setIsLogin }) => {
  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 flex items-center justify-center ">
      {isLogin ? (
        <SignIn setIsLogin={setIsLogin} onClose={onClose} />
      ) : (
        <SignUp setIsLogin={setIsLogin} onClose={onClose} />
      )}

      <div
        onClick={onClose}
        className="fixed inset-0 bg-black opacity-40 shadow-black shadow-2xl"
      ></div>
    </div>
  );
};

export default AuthModal;
