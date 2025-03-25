import { Route, Routes, Navigate } from "react-router-dom";
import { useEffect, useState } from "react";
import LayoutWeb from "./components/layout/LayoutWeb";
import Home from "./pages/Home";
import DetailRecipe from "./pages/DetailRecipe";

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<LayoutWeb />}>
        <Route index element={<Home />} />
        <Route path="/detailRecipe/:id" element={<DetailRecipe />} />
      </Route>
    </Routes>
  );
};

export default App;
