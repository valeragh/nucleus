class CabinetsController < ApplicationController
  before_action :set_category
  before_action :authenticate_user!

  def show
    @user = current_user
  	@orders = current_user.orders
    @back_phone = BackPhone.new
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
      @q = Product.search(params[:q])
    end
end
