class PublicVideosController < ApplicationController
  def show  
    require 'tzinfo'
    customer_id = params[:customer_id]
    @customer = Customer.where(id: customer_id)
    @url = UrlStream.where(customer_id: @customer.ids).first
    @blockages = Blockage.where(customer_id: customer_id, status: true)
               
    tz = TZInfo::Timezone.get('America/Sao_Paulo')
    @data_atual_br = Time.now.in_time_zone(tz).strftime('%Y-%m-%d %H:%M:%S')
    Rails.logger.info("O valor de data atual é: #{@data_atual_br}")
    
    if @blockages.present?

      @first_blockage = @blockages.find { |blockage| blockage.data_hora_inicio.strftime('%Y-%m-%d %H:%M:%S') >= @data_atual_br || blockage.data_hora_final.strftime('%Y-%m-%d %H:%M:%S') >= @data_atual_br }
      if @first_blockage
        @data_inicio = @first_blockage.data_hora_inicio.strftime('%Y-%m-%d %H:%M:%S')
        @data_encerramento = @first_blockage.data_hora_final.strftime('%Y-%m-%d %H:%M:%S')
        Rails.logger.info("data início : #{@data_inicio}")
        Rails.logger.info("data encerramento : #{@data_encerramento}")
        if @data_atual_br < @data_inicio || @data_atual_br > @data_encerramento
          @transmissao_bloqueada = false
          @iframe_src = @url.url
        else
          @transmissao_bloqueada = true
          @youtube = @first_blockage.link_youtube
          @vimeo = @first_blockage.link_vimeo 
          @imagem = @first_blockage.link_imagem
          # -raise
        end
      else 
        @transmissao_bloqueada = false
        @iframe_src = @url.url
      end
      
    else 
      @transmissao_bloqueada = false
      @iframe_src = @url.url
    end
  end

end
