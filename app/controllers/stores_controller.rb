class StoresController < ApplicationController
  before_action :set_category

  def category
  	@category = Category.friendly.find(params[:id])
    @reviews = Review.where("status = 'Показать'").sample(3)
  end

  def pod_category
  	@pod_category = PodCategory.friendly.find(params[:id])
    @products = @pod_category.products.where("status != 'Скрыть'").order(:rang)
    @reviews = Review.where("status = 'Показать'").sample(3)
  end

  def product
    @product = Product.friendly.find(params[:id])
    @products = @product.pod_category.products.where('(status != ? AND id != ?)', 'Скрыть', @product.id).order(:rang)
    @reviews = Review.where("status = 'Показать'").sample(3)
    @product_reviews = @product.reviews
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
    end
end