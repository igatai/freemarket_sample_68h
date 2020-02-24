class ProductsController < ApplicationController

  def index
    @product = Product.where(brand_id: "1").first(3)
    @brand = Product.where(brand_id: "2").first(3)
  end

  def new

  end


  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # @product = Product.new(user_id: @current_user.id)
  end

  def show
    @product = Product.find(params[:id])
    @image = Image.find(params[:id])
    @product = Product.find_by(id: params[:id])
    if user_signed_in?
      if @product.user_id == current_user_id
        redirect_to("/products/1")
      else
        redirect_to("/products/1")
      end
    end
  end

  def update
    # @product = current_user
  end

  def destroy
    # @product = current_user
  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :image_id)
  end  

  def current
    @current_user = Current_user_id
  end

end

# if @products.user_id != @current_user
#   redirect_to("/purchase/new")
# end