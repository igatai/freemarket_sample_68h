class RemovePrefectureIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :prefecture_id, :int
  end
end
