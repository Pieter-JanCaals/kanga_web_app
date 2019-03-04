// -- These functions require Dinero.js to work properky --
import Dinero from 'dinero.js';

// -- Initialize DOM elements --
const tipAmount = document.querySelector("#tip-amount");
const grandTotal = document.querySelector("#grand-total");
const minus = document.querySelector(".drink-minus-btn");
const plus = document.querySelector(".drink-plus-btn");

// -- Initialize frequently used variables --
const initTotalValue = Dinero( { amount: (grandTotal.innerHTML.substr(1)) * 100 } );
let tipPercent = 15;
let tipAmountValue = initTotalValue.percentage(tipPercent);

// -- Updates tip amount and grand total on page load --
document.addEventListener('DOMContentLoaded', function() {
    recalculateTipAmountValue();
    recalculateGrandTotal();
}, false);

// -- Updates DOM elements with proper decimal formatting --
const updateDOMInnerHTML = (value, domElement) => {
  if (value.hasSubUnits()) {
    domElement.innerHTML = value.toFormat();
  } else {
    domElement.innerHTML = value.toFormat('$0');
  };
};

// -- Recalculates the tip amount and calls the update DOM function --
const recalculateTipAmountValue = () => {
  tipAmountValue = initTotalValue.percentage(tipPercent);
  updateDOMInnerHTML(tipAmountValue, tipAmount);
};

// -- Recalculates the grand total and calls the update DOM function --
const recalculateGrandTotal = () => {
  const grandTotalValue = initTotalValue.add(tipAmountValue);
  updateDOMInnerHTML(grandTotalValue, grandTotal);
};

// -- Tracks the plus and minus buttons and triggers the corresponding actions --
const initTipCounter = () => {
  // -- Minus button: --
  minus.addEventListener("click",() => {
    if(tipPercent !== 0) {
      minus.nextElementSibling.querySelector('input').stepDown(5);
      tipPercent -= 5;
      recalculateTipAmountValue();
      recalculateGrandTotal();
    };
  })

  // -- Plus button: --
  plus.addEventListener("click",() => {
    plus.previousElementSibling.querySelector('input').stepUp(5);
    tipPercent += 5;
    recalculateTipAmountValue();
    recalculateGrandTotal();
  })
};

// -- Export the require function to make AJAX work --
export { initTipCounter };
