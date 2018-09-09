class ErrorsController < ApplicationController
  before_action :set_category
  
  def not_found
  	render(:status => 404)
  end

  def internal_server_error
  	render(:status => 500)
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @reviews = Review.where("status = 'Показать'").sample(3)
      @contact = Contact.first
      @q = Product.search(params[:q])
    end
end