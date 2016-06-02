class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :type
      t.string :color
      t.string :price

      t.timestamps null: false
    end
  end
end
