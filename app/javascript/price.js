window.addEventListener('load', listPrice)

function listPrice(){
  const price = document.getElementById('item-price');
  price.addEventListener("keyup", () => {
    const feeValue = Math.floor(price.value * 0.1)
    const profitValue = price.value - feeValue;
    const fee = document.getElementById('add-tax-price');
    fee.innerHTML = feeValue;
    const profit = document.getElementById('profit');
    profit.innerHTML = profitValue;
  });
}