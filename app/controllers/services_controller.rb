class ServicesController < ApplicationController
  before_action :set_category

  def index
  	@services = Service.where(status: "Показать")
  end

  def show
  	@service = Service.friendly.find(params[:id])
  	@services = Service.where('(status = ? AND id != ?)', 'Показать', @service.id).sample(4)
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @reviews = Review.where("status = 'Показать'").sample(3)
      @contact = Contact.first
      @q = Product.search(params[:q])
    end
end
