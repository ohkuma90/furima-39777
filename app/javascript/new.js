function tax (){
  const priceArea = document.getElementById("item-price");
  priceArea.addEventListener("keyup", () => {
    const priceString = priceArea.value;
    const price = parseInt(priceString, 10);
    const tax = Math.floor(price / 10);;
    const profit = price - tax;
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    taxArea.innerHTML = `${tax}`;
    profitArea.innerHTML = `${profit}`;
  });
};

window.addEventListener('turbo:load', tax);
