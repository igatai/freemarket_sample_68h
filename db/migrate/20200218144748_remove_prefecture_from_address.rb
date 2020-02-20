class RemovePrefectureFromAddress < ActiveRecord::Migration[5.2]
  def change
    # remove_column :addresses, :prefecture, :text
    add_column :addresses, :prefecture_id, :integer, foreign_key: true
  end
end
