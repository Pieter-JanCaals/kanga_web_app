const toggleDisplay = (element) => {
  if (element.style.display === "block") {
    element.style.display = "none";
  } else {
    element.style.display = "block"
  }
}

const initDrinkCategoryButton = () => {
  // category
  const categoryBtn = document.getElementById('category_btn');
  const hiddenBtns = document.querySelectorAll(".hidden-btn");

  // drinks
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
  //       console.log(btn.nextElementSibling)
  //     })
  //   })
  // }
}

const handleClick = (event) => {
  console.log(event.target);
  switch (event.target.className) {
    case "drink-content":
      toggleDisplay(event.target.parentElement.querySelector('.hidden-order-btns'));
      break;
    case "drink-close-btn":
      toggleDisplay(event.target.parentElement);
      break;
    case "drink-minus-btn":
      event.target.nextElementSibling.querySelector('input').stepDown(1);
      break;
    case "drink-plus-btn":
      event.target.previousElementSibling.querySelector('input').stepUp(1);
      break;
  }
}

const drinkList = document.getElementById('drink-list')
drinkList.addEventListener("click", (event) => {
  handleClick(event);
})


export { initDrinkCategoryButton }
