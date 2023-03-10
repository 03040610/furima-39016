class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :item_category_id,   null: false
      t.integer :item_status_id,     null: false
      t.integer :delivery_charge_id, null: false
      t.integer :item_date_id,       null: false
      t.integer :prefecture_id,      null: false
      t.timestamps
    end
  end
end
