const toggleDisplay = (element) => {
  if (element.style.display === "block") {
    element.style.display = "none";
  } else {
    element.style.display = "block"
  }
}

const initDrinkCategoryButton = () => {
  const categoryBtn = document.getElementById('category_btn');
  const hiddenBtns = document.querySelectorAll(".hidden-btn");
  const drinks = document.querySelectorAll('.drink-content');

  if (categoryBtn) {
    categoryBtn.addEventListener("click", () => {
      hiddenBtns.forEach((element) => {
        if (element.style.display === "block") {
          element.style.display = "none";
        } else {
          element.style.display = "block"
        }
      })
    });

    hiddenBtns.forEach((element) => {
      element.addEventListener("click", () => {
        hiddenBtns.forEach((element) => {
          if (element.style.display === "block") {
            element.style.display = "none";
          } else {
            element.style.display = "block"
          }
        });
      })
    })
  }

  if (drinks) {
    drinks.forEach((drink) => {
      drink.addEventListener("click", () => {
        toggleDisplay(drink.parentElement.querySelector('.hidden-order-btns'));
      });
    })
  }
}

export { initDrinkCategoryButton }
