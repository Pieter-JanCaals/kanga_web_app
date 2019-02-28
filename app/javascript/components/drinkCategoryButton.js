const toggleDisplay = (element) => {
  if (element.style.display === "block") {
    element.style.display = "none";
  } else {
    element.style.display = "block"
  }
}

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
        hideCategoryBtns();
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
const drinkList = document.getElementById('drink-list')

const handleClick = (event) => {
  switch (event.target.className) {
    case "drink-content":
      hideOrderBtns();
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
    case "order-submit":
      hideOrderBtns();
      let category = document.getElementById('drink-title').innerText;
      const res = category.toLowerCase();
      document.querySelectorAll('.hidden-btn').forEach((btn) => {
        if (btn.innerText.toLowerCase() === category.toLowerCase()) {
          btn.click();
        }
      });

      // const xhttp = new XMLHttpRequest();
      // xhttp.onreadystatechange = function () {
      //   if (this.readyState == 4 && this.status == 200) {
      //     const temp = document.createElement("div");
      //     temp.innerHTML = this.response;
      //     drinkList.innerHTML = temp.querySelector('#drink-list').innerHTML;
      //   }
      // }
      // xhttp.open("get", window.location.href + "?category='7'", true);
      // xhttp.send();
      break;
  }
}

drinkList.addEventListener("click", (event) => {
  handleClick(event);
})


export { initDrinkCategoryButton }
