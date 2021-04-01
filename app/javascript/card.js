window.addEventListener('load', pay);

function pay(){
  Payjp.setPublicKey("pk_test_5c1f24b6b6f9392224d91faf");
  const form = document.getElementById('charge-form');
  form.addEventListener('submit', (e) =>{
    e.preventDefault()
    
    const formInfo = document.getElementById('charge-form')
    const formData = new FormData(formInfo)

    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    }
    Payjp.createToken(card, (status, response) => {
      debugger;
      if (status == 200) {
        const token = response.id;
        const formToken = document.getElementById('charge-form')
        const tokenObj = `<input name= "token", value= ${token} type= "hidden">`
        formToken.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute('name');
      document.getElementById("card-exp-month").removeAttribute('name');
      document.getElementById("card-exp-year").removeAttribute('name');
      
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();

    });
  });
};
