class Products < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :brand_id, :integer
    add_reference :products, :brand, foreign_key: true
  end
end
