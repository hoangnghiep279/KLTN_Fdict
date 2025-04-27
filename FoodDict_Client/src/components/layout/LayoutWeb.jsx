import { Outlet } from "react-router-dom";
import Header from "../Header";
import Footer from "../Footer";
import {
  fdecor1,
  fdecor2,
  fdecor3,
  fdecor4,
  fdecor5,
  fdecor6,
} from "../../assets/img.js";
function LayoutWeb() {
  return (
    <div className="font-opensan">
      <header className="sticky top-[-20px] z-50 ">
        <Header />
        {/* <Crolltotop /> */}
      </header>
      <main className="mt-32">
        <img src={fdecor4} alt="" className="fixed w-24 h-24 bottom-7 left-7" />
        <img
          src={fdecor2}
          alt=""
          className="fixed w-14 h-14 bottom-7 right-7"
        />
        <img src={fdecor3} alt="" className="fixed w-20 h-20 right-7" />
        <img src={fdecor1} alt="" className="fixed w-24 h-24 right-0 top-1/2" />
        <img src={fdecor6} alt="" className="fixed w-20 h-20 top-1/3" />
        <img src={fdecor5} alt="" className="fixed w-14 h-14 top-1/4 left-20" />
        <Outlet />
      </main>
      <footer className="mt-10">
        <Footer />
      </footer>
    </div>
  );
}

export default LayoutWeb;
