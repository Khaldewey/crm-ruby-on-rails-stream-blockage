class MembroCliente::HomeController < MembroCliente::ApplicationController
  def index
    @blockages = Blockage.where(customer_id: current_membro_cliente.customer_id)
    .where('data_hora_inicio >= ?', Date.current) 

    @cliente_url = "https://stream-blockage.blockage.com/public_videos/show/#{current_membro_cliente.customer_id}" 
    # @cliente_url = "http://localhost:3000/public_videos/show/#{current_membro_cliente.customer_id}"  
    # banner_category = BannerCategory.find_by_name('Banner Convênios')
    # @banners = banner_category.banners if banner_category.present?
    # -raise    
  end
  
  

end
