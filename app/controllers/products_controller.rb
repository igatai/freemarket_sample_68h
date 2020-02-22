class ProductsController < ApplicationController

  def index
    @product = Product.where(category_id: "1").first(3)
    @category = Product.where(category_id: "1").first(3)
    @brand = Product.where(brand_id: "2").first(3)
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def new
    
    @product = Product.new
    @category_parent_array = ["---"]
    #親カテゴリーのみ抽出 => 配列
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    # binding.pry
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end



  def create
    @product = Product.new(product_params)
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :condition, :status, :payment, :delivery_date, :delivery_method, :price, :user_id, :brand_id, :category ,:image_id, :prefecture_id)
  end  

end
