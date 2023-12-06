class Admin::UrlStreamsController < Admin::ResourceController
    def active_url
      @url = UrlStream.find_by_id(params[:slug])
      if @url.status == false || @url.status == nil
        @url.update_attribute(:status, true)
      elsif @url.status == true
        @url.update_attribute(:status, false)
      end
      redirect_to admin_url_streams_path
    end   

    def search
      authorize! :search, UrlStream
      @q = UrlStream.ransack(params[:q])
      
      if params[:q] && params[:q][:customer_id].present?
        @collection = @q.result(distinct: true).where(customer_id: params[:q][:customer_id] ).order(url: :asc).paginate(page: params[:page])
        # -raise
      else
        @collection = @q.result(distinct: true).order(url: :asc).paginate(page: params[:page])
      end
    
      render :index
    end
    
    

    def index
      @q = UrlStream.ransack(params[:q])
      @collection = @q.result(distinct: true).order(url: :asc)
      # Resto do código...
    end
      
end
