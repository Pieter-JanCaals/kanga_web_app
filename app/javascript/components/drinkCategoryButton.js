const initDrinkCategoryButton = () => {
  const categoryBtn = document.getElementById('category_btn');

  if (categoryBtn) {
    categoryBtn.addEventListener("click", () => {
      document.querySelectorAll(".hidden-btn").forEach((element) => {
        if (element.style.display === "block") {
          element.style.display = "none";
        } else {
          element.style.display = "block"
        }
      })
    });
  }
}

export { initDrinkCategoryButton }
