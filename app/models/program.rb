class Program < ApplicationRecord
    validates :title, :date_start, :date_end, :link, :image, presence: :true

    mount_uploader :image, DefaultUploader

    stringify :date_start, format: '%d/%m/%Y'
    stringify :date_end, format: '%d/%m/%Y'

end
