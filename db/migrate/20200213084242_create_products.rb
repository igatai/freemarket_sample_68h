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

      t.timestamps
    end
  end
end
