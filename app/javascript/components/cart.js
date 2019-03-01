
const initializeCartAnimation = () => {
  const $cart = $('#shopping-cart-btn .badge');
  const $cartIcon = $('#shopping-cart-btn .glyphicon');
  let flag = false;

  $('.add-item').on("click", () => {
    if (flag) { return; }
    flag = true;

    $cartIcon.addClass('cart-run');

    $cart.addClass('shake');

    $('#shopping-cart-btn').addClass('glow');

    setTimeout (function(){
    $cartIcon.removeClass('cart-run');
    $cart.removeClass('shake');
      $('#shopping-cart-btn').removeClass('glow');
      flag = false;
    },800);

  });
}

export  { initializeCartAnimation }

// shoppingCartBtn = document.querySelector("#shopping-cart-btn")
// cart = document.querySelector("#shopping-cart-btn .badge");
// cartIcon = document.querySelector("#shopping-cart-btn .glyphicon");

// addItemBtn = document.querySelector("#add-item");
// cartQuantity = Number.parseInt(cart.innerText);



// addItemBtn.addEventListener("click", () => {
//    if (flag) { return; }
//   flag = true;

//   cartQuantity++;
//   cart.innerHTML = cartQuantity;

//   cartIcon.classList.add('cart-run');
//   cart.classList.add('shake');

//   cartIcon.classList.add('glow');


//   setTimeout(() => {
//     cartIcon.classList.remove('cart-run');
//     cart.classList.remove('shake');
//     shoppingCartBtn.classList.remove('glow');
//     flag = false;
//     console.debug("done")
//    }, 800);
// });
