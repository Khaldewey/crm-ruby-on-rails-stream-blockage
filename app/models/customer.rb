class Customer < ApplicationRecord
    validates :razao_social, presence: true
    validates :nome_fantasia, presence: true
    validates :cnpj, presence: true
    validates :telefone, presence: true
    validates :email, presence: true
    has_many :membro_clientes
    # has_many :users 
    # has_many :blockages
    # has_one :url_streams 
    
    has_one :url_streams_customers, dependent: :destroy
    has_one :url_streams, through: :url_streams_customers

    has_many :blockage_customers, dependent: :destroy
    has_many :blockages, through: :blockage_customers

    has_many :user_customers, dependent: :destroy
    has_many :users, through: :user_customers
    ransackable_attributes('razao_social_or_nome_fantasia_or_cnpj_or_telefone_or_email')
   
end
