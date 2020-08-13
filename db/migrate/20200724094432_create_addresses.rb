class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.text :city, null:false
      t.string :address , null:false
      t.string :apartment
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.string :first_name_kana, null:false
      t.string :last_name_kana, null:false
      t.string :tel, null:false, limit: 11
      t.timestamps
    end
  end
end
