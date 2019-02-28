const initTotalValue = parseFloat(document.querySelector("#grand-total").innerHTML.substr(1));
let tip = 15;

const recalculateGrandTotal = () => {
  const grandTotal = document.querySelector("#grand-total");
  grandTotal.innerHTML = Math.round((initTotalValue * (parseFloat(tip) / 100 + 1)) * 100) / 100;
};

const initTipCounter = () => {
  const minus = document.querySelector(".drink-minus-btn");
  minus.addEventListener("click",() => {
    if(tip !== 0) {
      minus.nextElementSibling.querySelector('input').stepDown(5);
      tip -= 5;
      recalculateGrandTotal();
    };
  })
  const plus = document.querySelector(".drink-plus-btn");
  plus.addEventListener("click",() => {
    plus.previousElementSibling.querySelector('input').stepUp(5);
    tip += 5
    recalculateGrandTotal()
  })
};

export { initTipCounter }
export { recalculateGrandTotal }
