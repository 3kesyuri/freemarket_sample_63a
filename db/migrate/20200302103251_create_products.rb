class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

      t.string :name, null: false
      t.text :description, null: false
      t.string :condition, null: false
      t.string :delivery_charge, null: false
      t.string :delivery_origin, null: false
      t.string :shipping_date, null: false
      t.integer :price, null: false

      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
