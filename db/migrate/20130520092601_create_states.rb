class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.integer :state_status

      t.timestamps
    end
  end
end
