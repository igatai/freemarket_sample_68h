class ChangeNotnullToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_null  :products, :prefecture_id, false
  end
end
