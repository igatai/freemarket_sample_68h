class ChangeDataPrifectureToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :prefecture_id, :int
  end
end
