class Blockage < ApplicationRecord
    validates :data_hora_inicio, presence: true
    validates :data_hora_final, presence: true
    mount_uploader :link_imagem, DefaultUploader
    # belongs_to :customer 

    has_many :blockage_customers, dependent: :destroy
    has_many :customers, through: :blockage_customers 
end
