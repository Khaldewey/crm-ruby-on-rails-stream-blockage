class UrlStreamCustomer < ApplicationRecord
    belongs_to :customer
    belongs_to :url_stream
end
