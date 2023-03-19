const pay = () => {
  const payjp = Payjp('pk_test_dfe706ff6d8015daef18bf94')
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expElement.mount('#card-exp-year');
  cvcElement.mount('#card-cvc');

  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);
