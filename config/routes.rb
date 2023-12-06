Target::Application.routes.draw do
  get 'public_videos/show/:customer_id', to: 'public_videos#show', as: 'public_video'
  get 'check_for_new_blockages', to: 'membro_cliente/blockages#check_for_new_blockages'
  mount Ckeditor::Engine => '/ckeditor' 

  root to: 'membro_cliente/home#index' 
  namespace :frontend do 
    get 'carregamento', to: 'load#index', as: 'carregamento'
    get '/carregamento' => 'load#load', as: :carreg 
    get 'atualizar_estado', to: 'home#atualizar_estado'
  end

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  devise_for :membro_cliente, path: 'area-restrita', controllers: {registrations: 'membro_cliente/registrations'}
  namespace :membro_cliente, path: "area-restrita" do
    resources :blockages, only: [:create]
    get '/editar-senha' => 'edit_password#new', as: :edit_password
    patch '/editar-senha/password' => 'edit_password#update_password', as: :update_password
    
    root to: 'home#index'
  end

  devise_for :user, path: 'admin'
  namespace :admin do
    resources :users, :roles, :permissions, :usuarios

    get 'edit_password', to: 'users#edit_password',  as: :edit_password
    patch 'update_password', to: 'users#update_password',  as: :update_password
    put 'active_url/:slug', to: 'url_streams#active_url', as: :active_url
    put 'active_membro/:slug', to: 'membro_clientes#active_membro', as: :active_membro
    put 'active_block/:slug', to: 'blockages#active_block', as: :active_block
    resources :programs do
      collection do
        get 'search' => 'programs#search', as: :search
      end
    end   

    resources :url_streams do
      collection do
        get 'search' => 'url_streams#search', as: :search
      end
    end  


    resources :blockages do
      collection do
        get 'search' => 'blockages#search', as: :search
      end
    end 
    
    resources :customers do
      resources :membro_clientes do
        collection do
          match 'search' => 'membro_clientes#search', via: [:get, :post], as: :search        
        end
      end
      
      collection do
        match 'search' => 'customers#search', via: [:get, :post], as: :search        
      end
    end

    root to: 'dashboard#index'
  end 
end
