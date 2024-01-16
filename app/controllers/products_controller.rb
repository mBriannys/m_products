class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      redirect_to new_products_path, notice: "Product was not created. #{product.errors.full_messages}"
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_price, :product_description, :image)
  end

end
