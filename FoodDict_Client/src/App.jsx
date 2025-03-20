import { Route, Routes, Navigate } from "react-router-dom";
import { useEffect, useState } from "react";
import LayoutWeb from "./components/layout/LayoutWeb";
import Home from "./pages/Home";
import Contact from "./pages/Contact";

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<LayoutWeb />}>
        <Route index element={<Home />} />
        <Route path="contact" element={<Contact />} />
      </Route>
    </Routes>
  );
};

export default App;
