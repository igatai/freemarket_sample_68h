class ProductsController < ApplicationController

  def index
    @product = Product.where(category_id: "1").first(3)
    @category = Product.where(category_id: "1").first(3)
    @brand = Product.where(brand_id: "2").first(3)
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
  end

  def show
  end

  require 'payjp'
  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @product.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :image_id)
  end  

end
