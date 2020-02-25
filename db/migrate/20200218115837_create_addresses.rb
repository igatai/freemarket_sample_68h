class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id, null: false, foreign_key: true
      t.integer :zipcode, null: false
      t.text :city, null: false
      t.text :address, null: false
      t.text :building
      t.text :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
