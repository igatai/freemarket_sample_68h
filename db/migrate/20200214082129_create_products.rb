class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name , null: false
      t.text :content , null: false
      t.integer :condition_id , null: false, foreign_key: true
      # t.string :status , null: false
      # t.string :status , null: false, default: '出品中'
      # t.integer :status , null: false, default: 0
      t.integer :status_id , null: false, foreign_key: true, default: 1
      # t.string :payment , null: false
      # t.integer :payment , null: false
      t.integer :payment_id , null: false, foreign_key: true
      # t.integer :delivery_date , null: false
      t.integer :delivery_date_id , null: false, foreign_key: true
      # t.string :delivery_method , null: false
      t.integer :delivery_method_id , null: false, foreign_key: true
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
