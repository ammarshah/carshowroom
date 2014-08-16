class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :car_make
      t.string :car_model
      t.string :car_version
      t.integer :car_year
      t.string :car_city
      t.integer :car_mileage
      t.integer :car_price
      t.string :car_trans
      t.string :car_desc
      t.string :car_type
      t.boolean :car_approval
      t.integer :user_id

      t.timestamps
    end
  end
end
