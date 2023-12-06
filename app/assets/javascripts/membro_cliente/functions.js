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
}); 