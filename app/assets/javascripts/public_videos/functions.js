$(document).ready(function(){
      
  
    function verificarData() { 
      
      var dataAtual = new Date();
      var dataInicialStr = document.querySelector('.container').getAttribute('data-data-inicial');
      var dataEncerramentoStr = document.querySelector('.container').getAttribute('data-data-encerramento');
      
      dataAtual.setMinutes(dataAtual.getMinutes() + 5);

      var dataInicial = new Date(dataInicialStr);
      var dataEncerramento = new Date(dataEncerramentoStr);
      dataEncerramento.setMinutes(dataEncerramento.getMinutes() + 1);
      dataInicial.setMinutes(dataInicial.getMinutes() + 1);
      console.log("testando");
      console.log(dataInicial);
      console.log(dataAtual);
      console.log(dataEncerramento);
      
      var diferencaInicial = Math.abs(dataAtual - dataInicial);
      var diferencaEncerramento = Math.abs(dataAtual - dataEncerramento);
      var limitePrecisao = 1000; 
  
      if (diferencaInicial <= limitePrecisao || diferencaEncerramento <= limitePrecisao) {
        location.reload();
      }
    
      
    }  
    setInterval(verificarData, 1000);
    const customer_id = window.location.pathname.match(/\/public_videos\/show\/(\d+)/)[1];
    let lastBlockageId = parseInt(localStorage.getItem("lastBlockageId")) || 0;
    

    function checkForNewBlockages() {
      console.log("Verificando Bloqueios")
      $.ajax({
        url: "/check_for_new_blockages",
        method: "GET",
        data: { customer_id: customer_id, last_blockage_id: lastBlockageId  },
        success: function (data) {
          if (data.new_blockages) {
            var dataInicialStr = document.querySelector('.container').getAttribute('data-data-inicial');
            var dataEncerramentoStr = document.querySelector('.container').getAttribute('data-data-encerramento');
        
            if (dataInicialStr === null || dataEncerramentoStr === null || dataInicialStr.trim() === '' || dataEncerramentoStr.trim() === '') {
                location.reload();
                // checkForNewBlockages();
                // return;
              }else{
                return;
              }
            // location.reload();
            
          }
        },
      });
    }
  
    // Verifica novos Blockages a cada 60 segundos (ajuste conforme necessário)
     setInterval(checkForNewBlockages, 60000);
});  





