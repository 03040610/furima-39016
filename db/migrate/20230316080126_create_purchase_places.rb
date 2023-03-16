class CreatePurchasePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_places do |t|

      t.timestamps
    end
  end
end
