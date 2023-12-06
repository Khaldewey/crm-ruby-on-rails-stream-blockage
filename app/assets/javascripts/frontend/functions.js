$(document).ready(function(){
    $('.banner-carousel').lightSlider({
        item:1,
        slideMargin: 0,
        loop: true,
        auto: true,
        speed: 1900,
        pause: 7000,
        pager: true
    });
    
    //  function verificarData() { 
      
    //    var dataAtual = new Date();
    //    var dataInicial = new Date(document.querySelector('.container').getAttribute('data-data-inicial'));
    //    var dataEncerramento = new Date(document.querySelector('.container').getAttribute('data-data-encerramento'));
    //    dataEncerramento.setMinutes(dataEncerramento.getMinutes() + 1);
    //    dataInicial.setMinutes(dataInicial.getMinutes() + 1);
    //    console.log("testando");
    //    console.log(dataInicial);
    //    console.log(dataAtual);
    //    console.log(dataEncerramento);
      
    //    var diferencaInicial = Math.abs(dataAtual - dataInicial);
    //    var diferencaEncerramento = Math.abs(dataAtual - dataEncerramento);
    //    var limitePrecisao = 1000; 
  
    //    if (diferencaInicial <= limitePrecisao || diferencaEncerramento <= limitePrecisao) {
    //      location.reload();
    //    }
    
    
    //  } 

     
  
    //  setInterval(verificarData, 1000);
}); 