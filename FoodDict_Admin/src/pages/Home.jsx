import React from "react";
import { Link } from "react-router-dom";
import { ToastContainer, toast } from "react-toastify";
function Home() {
  const notify = () => toast.error("Wow so easy!");

  return <div className="ml-80 bg-[#F9FAFF] h-screen">Home</div>;
}

export default Home;
