class StoresController < ApplicationController
  before_action :set_category

  def category
  	@category = Category.friendly.find(params[:id])
    @pod_categories = @category.pod_categories
    @reviews = Review.where("status = 'Показать'").sample(3)
  end

  def pod_category
  	@pod_category = PodCategory.friendly.find(params[:id])
    @products = @pod_category.products.where("status != 'Скрыть'").order(:rang)
    @reviews = Review.where("status = 'Показать'").sample(3)
    @order_item = current_cart.order_items.new
  end

  def product
    @product = Product.friendly.find(params[:id])
    @products = @product.pod_category.products.where('(status != ? AND id != ?)', 'Скрыть', @product.id).order(:rang)
    @reviews = Review.where("status = 'Показать'").sample(3)
    @product_reviews = @product.reviews
    @order_item = current_cart.order_items.new
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
    end

end
