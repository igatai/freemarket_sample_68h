class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.integer :condition, null: false
      t.string :status, null: false
      t.string :payment, null: false
      t.integer :delivery_date, null: false
      t.string :delivery_method, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :brand_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
