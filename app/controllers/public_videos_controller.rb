class PublicVideosController < ApplicationController
  require 'tzinfo'
  require 'net/http'
  require 'json'
  def show  
    
    customer_id = params[:customer_id]
    @customer = Customer.where(id: customer_id)
    @url = UrlStream.where(customer_id: @customer.ids).first
    @data_atual_br = obter_horario_brasilia()
    @blockages = Blockage.where(customer_id: customer_id, status: true).where('data_hora_inicio > ?', @data_atual_br)
    #  -raise          
    
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


  private

  def obter_horario_brasilia
    begin
      uri = URI('http://worldtimeapi.org/api/timezone/America/Sao_Paulo')
      resposta = Net::HTTP.get_response(uri)
  
      if resposta.code == '200'
        dados = JSON.parse(resposta.body)
        horario_brasilia = Time.parse(dados['utc_datetime']).in_time_zone('America/Sao_Paulo')
        formated_horario = horario_brasilia.strftime('%Y-%m-%d %H:%M:%S')
        Rails.logger.info("Horário de Brasília obtido com sucesso: #{formated_horario}")
        return formated_horario
      else
        Rails.logger.error("Erro ao obter o horário de Brasília. Código de resposta: #{resposta.code}")
        raise StandardError, "Erro ao obter o horário de Brasília. Código de resposta: #{resposta.code}"
      end
    rescue StandardError => e
      Rails.logger.error("Erro ao obter o horário de Brasília: #{e.message}")
      raise e
    end
  end

end
