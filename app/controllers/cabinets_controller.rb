class CabinetsController < ApplicationController
  before_action :set_category
  before_action :authenticate_user!

  def show
  	@orders = current_user.orders
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @reviews = Review.where("status = 'Показать'").sample(3)
      @contact = Contact.first
    end
end
