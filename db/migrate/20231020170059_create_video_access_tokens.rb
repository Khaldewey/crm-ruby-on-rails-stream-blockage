class CreateVideoAccessTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :video_access_tokens do |t|
      t.string :token
      t.integer :membro_cliente_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
