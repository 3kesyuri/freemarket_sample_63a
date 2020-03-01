class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :family_name, null: false
      t.string :last_name, null: false
      t.string :family_name_kana, null: false
      t.string :last_name_kana, null: false
      t.integer :zip_code, null: false
      t.string :prefecture, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :apartment_name
      t.string :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
