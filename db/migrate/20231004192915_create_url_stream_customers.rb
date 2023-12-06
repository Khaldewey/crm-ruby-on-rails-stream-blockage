class CreateUrlStreamCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :url_stream_customers do |t|
      t.references :url_stream, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
