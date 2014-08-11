class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :car_type
      t.string :make
      t.string :model
      t.string :version

      t.timestamps
    end
  end
end
