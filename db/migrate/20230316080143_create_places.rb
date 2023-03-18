class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :city,              null: false
      t.string :address,           null: false
      t.integer :phone_number,     null: false
      t.string :building_name
      t.integer :postcode,          null: false
      t.integer :prefecture_id,    null: false
      t.timestamps
    end
  end
end
