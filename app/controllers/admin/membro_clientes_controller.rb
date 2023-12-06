class Admin::MembroClientesController < Admin::ResourceController
    belongs_to :customer, parent_class: Customer
    # before_action :find_customer
    # before_action :find_membro, only: [:edit, :update, :destroy]
    def index
    @q = MembroCliente.ransack(params[:q])
    # @noticia = @q.result(distinct: true)
    # @active_members = Member.where(active_member: true).first
    # -raise 
    @customer_id = params[:customer_id]
    @customer = Customer.find(params[:customer_id]) 
    @membros = MembroCliente.where(customer_id: @customer_id)
    end

    def search 
      authorize! :search, MembroCliente
      @q = MembroCliente.ransack(params[:q])
      # -raise
      @customer_id = params[:customer_id]
      @customer = Customer.find(params[:customer_id]) 
      # @collection = @q.result(distinct: true).order(created_at: :asc).paginate(page: params[:page])
      # @collection = @q.result(distinct: true).order(created_at: :asc).where(nome_fantasia: params[:q][:nome_fantasia])
      if params[:q] && params[:q][:nome].present?
          search_term = "%#{params[:q][:nome]}%"
          @collection = @q.result(distinct: true).order(created_at: :asc).where("nome ILIKE ?", search_term)
      end 
  
      if params[:q] && params[:q][:email].present?
          @collection = @q.result(distinct: true).order(created_at: :asc).where(email: params[:q][:email])
      end 
  
      if params[:q] && params[:q][:nome].present? && params[:q][:email].present?
          @collection = @q.result(distinct: true).order(created_at: :asc).where(email: params[:q][:email])
      end 
      
      if @collection == nil 
      @q = MembroCliente.ransack(params[:q])
      @membrocliente = @q.result(distinct: true)
      @collection = MembroCliente.order(created_at: :asc).all
      end 

      @membros = @collection.where(customer_id: @customer_id)
      # -raise
      render :index
    end 

    def new
    @customer = Customer.find(params[:customer_id])
    @membro = @customer.membro_clientes.build
    end 

    
    def create
      @customer = Customer.find(params[:customer_id])
      @membro = @customer.membro_clientes.build(membro_params)
    
      if @membro.save
        redirect_to admin_customer_membro_clientes_path(customer_id: @customer)
      else
        render :new
      end
    end

    def edit
    @customer = Customer.find(params[:customer_id])
    @membro = @customer.membro_clientes.find(params[:id])
    # @membro = MembroCliente.find(params[:id])
    end 

     def update
      #  @customer = Customer.find(params[:customer_id])
       @membro = MembroCliente.find(params[:id])
       if @membro.update(membro_params)
        redirect_to admin_customer_membro_clientes_path(customer_id: @membro.customer_id)
       else
         render :edit
       end
        # update! { collection_url }
     end

    def collection
    @q.result.paginate(:page => params[:page])
    end  

    # def update
    #   update! { collection_url }
    # end
    

    def active_membro
        
        @membro = MembroCliente.find_by_id(params[:slug])
        if @membro.status == false || @membro.status == nil
          @membro.update_attribute(:status, true)
        elsif @membro.status == true
          @membro.update_attribute(:status, false)
        end
        # -raise
        redirect_to admin_customer_membro_clientes_path(customer_id: @membro.customer_id)
    end  

    private

    def membro_params
      params.require(:membro_cliente).permit(:nome, :email, :telefone, :status, :password)
    end
end
