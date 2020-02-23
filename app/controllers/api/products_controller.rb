class Api::ProductController < ApplicationController

  def index
    get_category_children
    get_category_grandchildren
  end

  private
  # 親カテゴリー選択後のアクション
  def get_category_children
    # 選択された親カテゴリーに紐づく子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐づく
    @category_grandchildren = Category.find("#{:child_id}").children
  end

end