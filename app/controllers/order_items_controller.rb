class OrderItemsController < ApplicationController

  def create
    @cart = current_cart
    @order_item = @cart.order_items.new(order_item_params)
    existing_order = @cart.order_items.where(product_id: params[:order_item][:product_id])
    if existing_order.count >= 1
      existing_order.last.update_column(:quantity, existing_order.last.quantity + params[:order_item][:quantity].to_i)
    else
      @cart.save
    end
    session[:cart_id] = @cart.id
  end

  def update
    @cart = current_cart
    @order_item = @cart.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @cart.order_items.order(id: :desc)
    @order = Order.new
  end

  def destroy
    @cart = current_cart
    @order_item = @cart.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @cart.order_items.order(id: :desc)
    @order = Order.new
  end

  private
    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id, :cart_id, :unit_price, :total_price)
    end
end
