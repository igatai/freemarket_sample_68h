class ProductsController < ApplicationController

  def index
    @product = Product.where(brand_id: "1").first(3)
    @brand = Product.where(brand_id: "2").first(3)
  end

  def new

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
