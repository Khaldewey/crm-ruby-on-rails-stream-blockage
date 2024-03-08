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
  
  
  
  var copyButton = document.getElementById('copy-link');
  var iframe = document.querySelector('iframe');

  copyButton.addEventListener('click', function() {
    var iframeHtml = iframe.outerHTML;

    var input = document.createElement('input');
    input.value = iframeHtml;
    document.body.appendChild(input);
    input.select();
    document.execCommand('copy');
    document.body.removeChild(input);

    alert('Conteúdo do iframe copiado para a área de transferência.');
  });
  
  const tipoDropdown = document.getElementById('tipo-dropdown');
  const youtubeField = document.getElementById('youtube-field');
  const vimeoField = document.getElementById('vimeo-field');
  const imagemField = document.getElementById('imagem-field');

  tipoDropdown.addEventListener('change', function() {
    const selectedOption = tipoDropdown.value;
    youtubeField.style.display = 'none';
    vimeoField.style.display = 'none';
    imagemField.style.display = 'none';

    if (selectedOption === 'YouTube') {
      youtubeField.style.display = 'block';
    } else if (selectedOption === 'Vimeo') {
      vimeoField.style.display = 'block';
    } else if (selectedOption === 'Imagem') {
      imagemField.style.display = 'block';
    }
  }); 
  async function obterHorarioBrasilia() {
    try {
        const resposta = await fetch('http://worldtimeapi.org/api/timezone/America/Sao_Paulo');
        const dados = await resposta.json();

        // A propriedade "datetime" contém a data e hora atual em Brasília
        const horarioBrasilia = new Date(dados.utc_datetime);
        return horarioBrasilia;
    } catch (erro) {
        console.error('Erro ao obter o horário de Brasília:', erro);
    }
  }


    // Função para atualizar o relógio
    async function atualizarRelogioBrasilia() {
      const dataAtual = await obterHorarioBrasilia();
      const relogioElement = document.querySelector('h2');
      const horaFormatada = dataAtual.toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' });
      // Atualizar o conteúdo do elemento com o horário de Brasília
      relogioElement.innerText = `Horário Oficial de Brasília: ${horaFormatada}`;
    }

    // Atualizar a cada minuto (60000 milissegundos)
    setInterval(atualizarRelogioBrasilia, 60000);

    // Chamar a função pela primeira vez
    atualizarRelogioBrasilia();
 
}); 