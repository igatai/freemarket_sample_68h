class ProductsController < ApplicationController

  def index
    @product = Product.where(category_id: "1").first(3)
    @category = Product.where(category_id: "1").first(3)
    @brand = Product.where(brand_id: "2").first(3)
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def new

  end


  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  def show
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :image_id)
  end  

end
