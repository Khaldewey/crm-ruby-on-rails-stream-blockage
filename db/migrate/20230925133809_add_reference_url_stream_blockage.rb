class AddReferenceUrlStreamBlockage < ActiveRecord::Migration[5.2]
  def change
    add_reference :blockages, :url_stream, index: true
    add_foreign_key :blockages, :url_streams
  end
end
