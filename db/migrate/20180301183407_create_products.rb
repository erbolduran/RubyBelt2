class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :seller_id
      t.integer :buyer_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
