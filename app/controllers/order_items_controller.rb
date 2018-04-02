class OrderItemsController < ApplicationController
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @order_item = @cart.add_product(product.id)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order_item.cart }
        format.js { @current_item = @order_item}
        format.json { render json: @order_item, status: :created, location: @order_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order_item = @cart.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order_item.cart }
        format.js { @current_item = @order_item}
        format.json { render json: @order_item, status: :created, location: @order_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
    @order_items = @cart.order_items.order(id: :desc)
    @order = Order.new
  end

  def destroy
    @order_item = @cart.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @cart.order_items.order(id: :desc)
  end

  private
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id, :cart_id)
    end

    def set_cart
      @cart = current_cart
    end
end
