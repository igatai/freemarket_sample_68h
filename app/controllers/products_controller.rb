class ProductsController < ApplicationController

  def index
    @product = Product.where(category_id: "1").first(3)
    @category = Product.where(category_id: "1").first(3)
    @brand = Product.where(brand_id: "2").first(3)
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def new
    @product = Product.new
    # セレクトボックスの初期値を設定
      # @category_parent_id_array = [""]

      # @category_parent_name_array = ["-------"]
      # @category_parent_array = [{id: "", name: "-------"}]
      # 親カテゴリーを抽出

    category_parent_hash = {}
    @category_parent_array = []

    Category.where(ancestry: nil).each do |parent|
      # @category_parent_id_array << parent.id


      # @category_parent_array = [{id:}] << parent.id
      # @category_parent_array = [{name:}] << parent.name

      # @category_parent_array = {}

    #   hash2.each do |key, value|
    #     puts "key = #{key}"
    #     puts "value = #{value}"
    #  end
      # binding.pry
      # category_parent_hash[:id] = parent.id
      # category_parent_hash[:name] = parent.name
      category_parent_hash = {id: parent.id, name: parent.name}
      @category_parent_array << category_parent_hash
    end

    # binding.pry
  end

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

  def create
    @product = Product.new(product_params)
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :image_id)
  end

end
