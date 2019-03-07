import "bootstrap";

import { initializeCartAnimation } from "../components/cart.js";

initializeCartAnimation();

window.initializeCartAnimation = initializeCartAnimation;


/// map

const card_open = document.querySelector("#eta");
const open_map = document.querySelector("#map_open");
const close_map = document.querySelector("#map_close");
const map = document.querySelector("#map");
const markers = document.querySelectorAll('.mapboxgl-marker');
// map.classList.add("hide");
if (open_map && close_map) {
 card_open.addEventListener("click", (event) => {
   // map.classList.toggle("hide");
   console.log(event.currentTarget);
   if (open_map.classList.contains('hide'))
   {
     close_map.classList.toggle("hide");
     open_map.classList.toggle("hide");
     map.style.position = 'relative';
     $("#map").slideDown(400)
  }
  else {
    close_map.classList.toggle("hide");
     open_map.classList.toggle("hide");
     $("#map").slideUp(400)
  };
 });
}


