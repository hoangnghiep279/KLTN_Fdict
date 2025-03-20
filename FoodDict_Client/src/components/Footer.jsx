import { social } from "../assets/img.js";

const Footer = () => {
  return (
    <footer className="font-manrope ">
      <div className="bg-[#FFFAE3]  p-12">
        <div className="container">
          <div className="flex justify-between">
            {/* col-1 */}
            <div>
              <h3 className="mb-6 font-bold text-base">Customer Service</h3>
              <ul className="text-[#575363]">
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Contact Us
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    FAQs
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Order Lookup
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Returns
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Shipping & Delivery
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Corporate Gifting
                  </a>
                </li>
              </ul>
            </div>
            {/* col-2 */}
            <div>
              <h3 className="mb-6 font-bold text-base">Customer Service</h3>
              <ul className="text-[#575363]">
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Careers
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    News & Blog
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Press Center
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Investors
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Suppliers
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Terms & Conditions
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Privacy Policy
                  </a>
                </li>
              </ul>
            </div>
            {/* col-3 */}
            <div>
              <h3 className="mb-6 font-bold text-base">Customer Service</h3>
              <ul className="text-[#575363]">
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Gift Cards
                  </a>
                </li>

                <li>
                  <a className="py-2 block text-sm" href="#">
                    Gift Cards Balance
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Shop with Points
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Reload Your Balance
                  </a>
                </li>
              </ul>
            </div>
            {/* col-4 */}
            <div>
              <h3 className="mb-6 font-bold text-base">Customer Service</h3>
              <ul className="text-[#575363]">
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Start Selling
                  </a>
                </li>
                <li>
                  <a className="py-2 block text-sm" href="#">
                    Learn to Sell
                  </a>
                </li>

                <li>
                  <a className="py-2 block text-sm" href="#">
                    Affiliates & Partners
                  </a>
                </li>
              </ul>
            </div>
            <div>
              <h3 className="mb-6 font-bold text-base">Follow us</h3>
              <span>
                <img src={social} alt="" />
              </span>
            </div>
          </div>
        </div>
      </div>
      {/* footer-bottom */}
      <div className="bg-[#FFFAE3] p-7">
        <div className="container text-[#131717] flex items-center justify-between">
          <h3 className="text-xl  font-bold font-slab">Food Dictionary</h3>
          <p className="text-sm font-manrope">
            Copyright © 2022 UIHUT All Rights Reserved
          </p>
        </div>
      </div>
    </footer>
  );
};
export default Footer;
