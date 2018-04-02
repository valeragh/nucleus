class OrdersController < ApplicationController
  before_action :set_category
  before_filter :disable_nav
  before_filter :authenticate_user!, only: [:show]

  def show
    @order = Order.find(params[:id])
  end

  def new
    @cart = current_cart
    if @cart.order_items.empty?
      redirect_to root_url, flash[:danger] = "Ваша корзина пуста"
      return
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_order_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        #UserMailer.order_admin_confirmation(@order).deliver
        #UserMailer.order_confirmation(@order).deliver
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to @order }
        flash[:success] = "Спасибо за Ваш заказ"
        sign_in(User.find(@order.user_id), scope: :user)
      else
        format.html { render :new }
        flash[:danger] = "Заполните все поля"
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
	  def order_params
	    params.require(:order).permit(:desciption, :user_id, :email, :phone, :status, :total, :delivery)
	  end

    def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
    end

    def disable_nav
      @disable_nav = true
    end

end
