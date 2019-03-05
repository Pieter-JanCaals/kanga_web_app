const hideDisplay = (element) => {
  if (element.style.display === "block") {
    element.style.display = "none";
  }
}

const hideOrderBtns = () => {
  document.querySelectorAll('.hidden-order-btns').forEach((element) => {
    hideDisplay(element)
  })
}

const hideCategoryBtns = () => {
  document.querySelectorAll(".hidden-btn").forEach((element) => {
    if (element.style.display === "block") {
      element.style.display = "none";
    }
  });
}

const initDrinkCategoryButton = () => {
  // category
  const categoryBtn = document.getElementById('category_btn');
  const hiddenBtns = document.querySelectorAll(".hidden-btn");

  // drinks
  const mainContainer = document.querySelector('.grey_main_body');
  const drinks = document.querySelectorAll('.drink-content');
  const closeBtns = document.querySelectorAll('.drink-close-btn');
  const plusBtns = document.querySelectorAll('.drink-plus-btn');
  const minusBtns = document.querySelectorAll('.drink-minus-btn');

  // category
  if (categoryBtn) {
    categoryBtn.addEventListener("click", () => {

      hiddenBtns.forEach((element) => {
        if (element.style.display === "block") {
          element.style.display = "none";
        } else {
          element.style.display = "block"
        }
      })

      if (mainContainer.classList.contains('greybody')){
        mainContainer.classList.remove('greybody');
      }
      else {
        mainContainer.classList.add('greybody');
      }
    });

    hiddenBtns.forEach((element) => {
      element.addEventListener("click", () => {
        hideCategoryBtns();
        mainContainer.classList.remove('greybody');
      })
    })
  }

  // // drinks
  // if (drinks) {
  //   drinks.forEach((drink) => {
  //     drink.addEventListener("click", () => {
  //       toggleDisplay(drink.parentElement.querySelector('.hidden-order-btns'));
  //     });
  //   })
  // }

  // if (closeBtns) {
  //   closeBtns.forEach((btn) => {
  //     btn.addEventListener("click", () => {
  //       toggleDisplay(btn.parentElement);
  //     })
  //   })
  // }

  // if (plusBtns) {
  //   plusBtns.forEach((btn) => {
  //     btn.addEventListener("click", () => {
  //       btn.previousElementSibling.querySelector('input').stepUp(1);
  //     })
  //   })
  // }

  // if (minusBtns) {
  //   minusBtns.forEach((btn) => {
  //     btn.addEventListener("click", () => {
  //       btn.nextElementSibling.querySelector('input').stepDown(1);
  //       console.debug(btn.nextElementSibling)
  //     })
  //   })
  // }
}



export { initDrinkCategoryButton }
