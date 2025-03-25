import { Outlet } from "react-router-dom";
import Header from "../Header";
import Footer from "../Footer";

function LayoutWeb() {
  return (
    <div className="font-opensan">
      <header className="sticky top-[-20px] z-50 ">
        <Header />
        {/* <Crolltotop /> */}
      </header>
      <main className="mt-32">
        <Outlet />
      </main>
      <footer>
        <Footer />
      </footer>
    </div>
  );
}

export default LayoutWeb;
