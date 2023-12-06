class Admin::BlockagesController < Admin::ResourceController
  def active_block
      @blockage = Blockage.find_by_id(params[:slug])
      if @blockage.status == false || @blockage.status == nil
        @blockage.update_attribute(:status, true)
      elsif @blockage.status == true
        @blockage.update_attribute(:status, false)
      end
      redirect_to admin_blockages_path
    end 
   
    def search
      authorize! :search, Blockage
      @q = Blockage.ransack(params[:q])
      
      if params[:q] && params[:q][:customer_id].present?
        @collection = @q.result(distinct: true).where(customer_id: params[:q][:customer_id] ).paginate(page: params[:page])
        # -raise
      else
        @collection = @q.result(distinct: true).paginate(page: params[:page])
      end
    
      render :index
    end 


    def index
      @q = Blockage.ransack(params[:q])
      @collection = @q.result(distinct: true)
      
    end
end
