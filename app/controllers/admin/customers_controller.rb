class Admin::CustomersController < Admin::ResourceController
    def index    
        @q = Customer.ransack(params[:q])
        @customer = @q.result(distinct: true)
        @collection = Customer.order(created_at: :asc).all  
    end 


    def search
    authorize! :search, Customer
    @q = Customer.ransack(params[:q])
    # @collection = @q.result(distinct: true).order(created_at: :asc).paginate(page: params[:page])
    # @collection = @q.result(distinct: true).order(created_at: :asc).where(nome_fantasia: params[:q][:nome_fantasia])
    if params[:q] && params[:q][:nome_fantasia].present?
        search_term = "%#{params[:q][:nome_fantasia]}%"
        @collection = @q.result(distinct: true).order(created_at: :asc).where("nome_fantasia ILIKE ?", search_term)
    end 

    if params[:q] && params[:q][:email].present?
        @collection = @q.result(distinct: true).order(created_at: :asc).where(email: params[:q][:email])
    end 

    if params[:q] && params[:q][:nome_fantasia].present? && params[:q][:email].present?
        @collection = @q.result(distinct: true).order(created_at: :asc).where(email: params[:q][:email])
    end 
    
    if @collection == nil 
    @q = Customer.ransack(params[:q])
    @customer = @q.result(distinct: true)
    @collection = Customer.order(created_at: :asc).all
    end
    
    render :index   
    end

    def collection    
    @q.result.paginate(:page => params[:page])
    end  
    
end
