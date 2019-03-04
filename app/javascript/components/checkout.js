// -- Initialize DOM elements --
const tipAmount = document.querySelector("#tip-amount");
const grandTotal = document.querySelector("#grand-total");
const minus = document.querySelector(".checkout-tip .drink-minus-btn");
const plus = document.querySelector(".checkout-tip .drink-plus-btn");

// -- Initialize frequently used variables --
const initTotalValue = Math.round(parseFloat(document.querySelector("#grand-total").innerHTML.substr(1)) * 100) / 100;
let tipPercent = 15;
let tipTotal = Math.round((initTotalValue * (parseFloat(tipPercent) / 100)) * 100) / 100;

// -- Then, a buch of stuff happens... --
const recalculateTipTotal = () => {
  tipTotal = Math.round((initTotalValue * (parseFloat(tipPercent) / 100)) * 100) / 100;
  tipAmount.innerHTML = `$${tipTotal}`;
};

const recalculateGrandTotal = () => {
  const grandTotalValue = Math.round((initTotalValue + tipTotal) * 100) / 100;
  grandTotal.innerHTML = `$${grandTotalValue}`;
};

const initTipCounter = () => {
  minus.addEventListener("click",() => {
    if(tipPercent !== 0) {
      minus.nextElementSibling.querySelector('input').stepDown(5);
      tipPercent -= 5;
      recalculateTipTotal();
      recalculateGrandTotal();
    };
  })
  plus.addEventListener("click",() => {
    plus.previousElementSibling.querySelector('input').stepUp(5);
    tipPercent += 5
    recalculateTipTotal();
    recalculateGrandTotal()
  })
};

export { initTipCounter }

// .toFixed(2)
