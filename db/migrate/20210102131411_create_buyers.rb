class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :item_id,    null: false, foreign_key: true
      t.string :user_id,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
