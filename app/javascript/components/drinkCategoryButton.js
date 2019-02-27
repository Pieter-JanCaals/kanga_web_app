const initDrinkCategoryButton = () => {
  const categoryBtn = document.getElementById('category_btn');
  const hiddenBtns = document.querySelectorAll(".hidden-btn");

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
}

export { initDrinkCategoryButton }

/*
  4) get request with ajax
*/
