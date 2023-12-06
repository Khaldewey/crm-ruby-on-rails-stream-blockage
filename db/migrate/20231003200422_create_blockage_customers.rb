class CreateBlockageCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :blockage_customers do |t|
      t.references :blockage, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
