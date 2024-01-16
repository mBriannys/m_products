class CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all.where(invoice_id: nil)
    @total_price_cart = CartItem.total_price_cart(cart_items: @cart_items)
    @invoice = Invoice.new
  end

  def create
    @product = Product.find(params[:cart_item][:product_id])
    @cart_item = CartItem.find_by(product_id: @product.id)
    if @cart_item.present? && @cart_item.invoice_id.nil?
      @cart_item.update_quantity(@cart_item.quantity + params[:cart_item][:quantity].to_i)
      flash[:notice] = 'Product was successfully added to cart.'
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      if @cart_item.save
        flash[:notice] = 'Product was successfully added to cart.'
        redirect_to cart_items_path
      else
        flash[:alert] = "Product was not added to cart. #{@cart_item.errors.full_messages}"
        redirect_to @product
      end
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy!
      redirect_to cart_items_path, notice: 'Product was successfully removed from cart.'
    else
      flash[:alert] = "Product was not removed from cart. #{@cart_item.errors.full_messages}"
      redirect_to cart_items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end
