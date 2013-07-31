class CreateCustomerSupports < ActiveRecord::Migration
  def change
    create_table :customer_supports do |t|
      t.string :name
      t.string :username

      t.timestamps
    end
  end
end
