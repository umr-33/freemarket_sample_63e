class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :description, null: false
      # t.references :brand, null: false, foreign_key: true
      # t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :prefecture_id, null: false
      t.integer :shipping_charger_id, null: false
      t.integer :shipping_method_id, null: false
      t.integer :days_to_ship_id, null: false
      t.integer :item_status_id, null: false
      t.integer :trade_method_id, null: false
    end
  end
end
