class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :image, null:false
      t.references :product, foreing_key:true
      t.timestamps
    end
  end
end
