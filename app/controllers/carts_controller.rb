class CartsController < ApplicationController
  before_action :set_category

  def show
  	@cart = current_cart
  	@order_items = @cart.order_items.order(id: :desc)
    @order = Order.new
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
    end

end
