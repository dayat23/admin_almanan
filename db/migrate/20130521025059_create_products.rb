class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code_product
      t.string :name_product
      t.integer :stock
      t.integer :status, default: 1
      t.integer :category_id

      t.timestamps
    end
  end
end
