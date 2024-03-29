class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :city,              null: false
      t.string :address,           null: false
      t.string :phone_number,      null: false
      t.string :building_name
      t.string :post_code,         null: false
      t.integer :prefecture_id,    null: false
      t.references :purchase,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
