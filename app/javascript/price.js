function price () {
  const inputPrice  = document.getElementById("item-price");
  const addTaxDom   = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");

  inputPrice.addEventListener("input",() => {
    const inputValue = parseInt(inputPrice.value);
    addTaxDom.innerHTML = Math.floor(inputValue/10);
    profitPrice.innerHTML = Math.floor(inputValue*0.9);
    console.log(inputValue);
  })
} 
window.addEventListener('load', price);