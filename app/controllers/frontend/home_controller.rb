class Frontend::HomeController < Frontend::ApplicationController
  def index
    require 'tzinfo'

    tz = TZInfo::Timezone.get('America/Sao_Paulo')

    @data_atual_br = Time.now.in_time_zone(tz).strftime('%Y-%m-%d %H:%M:%S')

    
    @data_inicio = tz.local_to_utc(DateTime.new(2023, 9, 19, 14, 49, 0) - Rational(3, 24)).strftime('%Y-%m-%d %H:%M:%S')
    @data_encerramento = tz.local_to_utc(DateTime.new(2023, 9, 19, 14, 56, 59) - Rational(3, 24)).strftime('%Y-%m-%d %H:%M:%S')

    if @data_atual_br < @data_inicio || @data_atual_br > @data_encerramento
      @transmissao_bloqueada = false
      @iframe_src = "https://us-east-1.prod.tvcoins.com/player/player.html?tenant-id=culturaplay&channel-id=2457d4f0-1519-4d1d-bc46-3cbe03074e72&autoplay=true"

    else
      @transmissao_bloqueada = true
    end 
     
  end

  def atualizar_estado
    redirect_to frontend_carregamento_path, turbo: true
  end

  


  

end
