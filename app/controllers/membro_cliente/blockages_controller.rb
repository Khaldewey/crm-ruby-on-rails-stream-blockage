class MembroCliente::BlockagesController < MembroCliente::ApplicationController
    before_action :authenticate_membro_cliente!
    def create
        @blockage = Blockage.new(blockage_params)
        @blockage.customer_id = current_membro_cliente.customer_id
        
        if @blockage.save
          
          # -raise
          redirect_to root_path, notice: 'Blockage adicionado com sucesso.'
          # redirect_to public_video_path(customer_id: @blockage.customer_id)
        else
          render :index
        end
      end
      
      def check_for_new_blockages
        last_blockage_id = params[:last_blockage_id].to_i
        customer_id = params[:customer_id]
        # Verifique se há novos blockages desde o último verificado
        new_blockages = Blockage.where("customer_id = ? AND id > ? AND data_hora_inicio >= ?", customer_id, last_blockage_id, Time.current)
        
        if new_blockages.any?
          # Há novos blockages, envie uma resposta JSON
          render json: { new_blockages: true }
        else
          # Não há novos blockages
          head :no_content
        end
      end
      private

      def blockage_params
        params.require(:blockage).permit(:data_hora_inicio, :data_hora_final, :link_youtube, :link_vimeo, :link_imagem, :url_stream_id, :status)
      end
end