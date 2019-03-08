import "bootstrap";

import { initializeCartAnimation } from "../components/cart.js";

initializeCartAnimation();

window.initializeCartAnimation = initializeCartAnimation;


/// map

const eta = document.querySelector("#eta");
const map = document.getElementById('map');

eta.addEventListener("click", () => {
  map.classList.toggle("map_open")
})
// map.classList.add("hide");
// if (open_map && close_map) {
//  card_open.addEventListener("click", (event) => {
//    // map.classList.toggle("hide");
//    console.log(event.currentTarget);
//    if (open_map.classList.contains('hide'))
//    {
//      close_map.classList.toggle("hide");
//      open_map.classList.toggle("hide");
//      map.style.position = 'relative';
//      $("#map").slideDown(400)
//     }
//   else {
//      $("#map").slideUp(400)
//     close_map.classList.toggle("hide");
//      open_map.classList.toggle("hide");
//   };
//  });
// }


