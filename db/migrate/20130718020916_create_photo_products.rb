class CreatePhotoProducts < ActiveRecord::Migration
  def change
    create_table :photo_products do |t|
      t.string :image_product
      t.text :description
      t.integer :product_id

      t.timestamps
    end
  end
end
