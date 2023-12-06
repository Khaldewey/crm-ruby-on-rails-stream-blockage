class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :title
      t.datetime :date_start
      t.datetime :date_end      
      t.string :link
      t.string :image

      t.timestamps
    end
  end
end
