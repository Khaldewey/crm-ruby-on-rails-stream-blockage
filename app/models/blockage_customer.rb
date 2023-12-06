class BlockageCustomer < ApplicationRecord
    belongs_to :customer
    belongs_to :blockage
end
