const handleClick = (event) => {
  console.debug(event.target)
  switch (event.target.className) {
    case "col-sm-6":
      toggleDisplay(event.target.parentElement.parentElement.parentElement.querySelector('.hidden-order-btns'));
      break;
    case "card":
      console.debug()
      toggleDisplay(event.target.parentElement.parentElement.querySelector('.hidden-order-btns'));
      break;
    case "drink-close-btn":
      toggleDisplay(event.target.parentElement.parentElement.parentElement);
      break;
    case "drink-minus-btn":
      event.target.nextElementSibling.querySelector('input').stepDown(1);
      break;
    case "drink-plus-btn":
      event.target.previousElementSibling.querySelector('input').stepUp(1);
      break;
    case "order-submit":
      hideOrderBtns();
      const category = document.getElementById('drink-title').innerText;
      const res = category.toLowerCase();
      document.querySelectorAll('.hidden-btn').forEach((btn) => {
        if (btn.innerText.toLowerCase() === category.toLowerCase()) {
          btn.click();
        }
      });
      break;
    case "category-btn":
      hiddenBtns.forEach((element) => {
        if (element.style.display === "block") {
          element.style.display = "none";
        } else {
          element.style.display = "block"
        }
      })

      break;
  }
}

const toggleDisplay = (element) => {
  if (element.style.display === "block") {
    element.style.display = "none";
  } else {
    element.style.display = "block"
  }
}

const initAddRemoveDrinks = () => {
  const drinkList = document.getElementById('drink-list');
  const hiddenBtns = document.querySelectorAll(".hidden-btn");

  hiddenBtns.forEach((element) => {
    element.addEventListener("click", () => {
      hideCategoryBtns();
    });
  });

  drinkList.addEventListener("click", (event) => {
    handleClick(event);
  });
}

export { initAddRemoveDrinks }
