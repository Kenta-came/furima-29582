class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :buyer_id,     null: false, foreign_key: true
      t.string  :post_num,     null: false
      t.integer :ship_pref_id, null: false
      t.string  :city,         null: false
      t.string :house_num,     null: false
      t.string :building 
      t.string :tel,           null: false
      
      t.timestamps
    end
  end
end
