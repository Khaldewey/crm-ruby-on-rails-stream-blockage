class CreateBlockages < ActiveRecord::Migration[5.2]
  def change
    create_table :blockages do |t|
      t.references :customer, index: true, foreign_key: true
      t.datetime :data_hora_inicio
      t.datetime :data_hora_final
      t.string :link_youtube
      t.string :link_vimeo
      t.string :link_imagem
      t.boolean :status
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
