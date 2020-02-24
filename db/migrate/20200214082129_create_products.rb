class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name , null: false
      t.text :content , null: false
      t.integer :condition , null: false
      # t.string :status , null: false
      t.string :status , null: false, default: '出品中'
      t.string :payment , null: false
      t.integer :delivery_date , null: false
      # t.string :delivery_method , null: false
      t.string :delivery_method , null: false , default: '未定'
      t.integer :price , null: false
      t.integer :user_id , null: false, foreign_key: true
      t.integer :brand_id , null: false, foreign_key: true
      t.integer :category_id , null: false
      t.integer :prefecture_id , null: false, foreign_key: true
      t.datetime :created_at , null: false
      t.datetime :updated_at , null: false
      t.timestamps
    end
  end
end
