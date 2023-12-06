class CreateUrlStreams < ActiveRecord::Migration[5.2]
  def change
    create_table :url_streams do |t|
      t.references :customer, index: true, foreign_key: true
      t.string :url
      t.boolean :status
      t.timestamps
    end
  end
end
