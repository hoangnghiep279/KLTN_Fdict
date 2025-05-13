import { Swiper, SwiperSlide } from "swiper/react";
import { Pagination, Autoplay, Navigation } from "swiper/modules";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import Food from "./Food";

function Slider({ recipes }) {
  return (
    <section className="py-2 container">
      <div>
        <Swiper
          slidesPerView={3}
          spaceBetween={30}
          // navigation
          modules={[Pagination, Autoplay]}
          autoplay={{ delay: 3000, disableOnInteraction: false }}
          className="w-full rounded-lg"
        >
          {recipes.map((recipe, index) => (
            <SwiperSlide key={index}>
              <Food key={recipe.id} recipe={recipe} />
            </SwiperSlide>
          ))}
        </Swiper>
      </div>
    </section>
  );
}

export default Slider;
