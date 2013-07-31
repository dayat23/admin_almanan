class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.integer :state_id
      t.integer :status, default: 1
      t.decimal :price

      t.timestamps
    end
  end
end
