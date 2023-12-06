class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :razao_social
      t.string :nome_fantasia
      t.string :cnpj      
      t.string :inscricao_estadual
      t.string :inscricao_municipal
      t.string :endereco
      t.string :numero
      t.string :bairro      
      t.string :cep
      t.string :estado
      t.string :cidade
      t.string :site
      t.string :email      
      t.string :telefone
      t.string :campo
      t.timestamps
    end
  end
end
