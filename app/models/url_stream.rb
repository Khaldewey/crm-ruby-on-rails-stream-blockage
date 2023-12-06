class UrlStream < ApplicationRecord
    validates :url, presence: true
    # belongs_to :customer 

    has_many :url_stream_customers, dependent: :destroy
    has_many :customers, through: :url_stream_customers
end
