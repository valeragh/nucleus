class ReviewsController < ApplicationController
  before_action :set_category
  before_action :set_cart

  def index
  	@product = Product.friendly.find(params[:product_id])
    @reviews = @product.reviews.where("status = 'Показать'")
    @review = @product.reviews.new
  end

  def show
    @product = Product.friendly.find(params[:product_id])
  	@review = Review.find(params[:id])
  end


  def all_reviews
    @reviews = Review.where("status = 'Показать'")
  end

  def new
    @product = Product.friendly.find(params[:product_id])
  	@review = @product.reviews.new
  end

  def create
    @product = Product.friendly.find(params[:product_id])
    @review = @product.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        #UserMailer.review_admin_confirmation(@review).deliver
        #UserMailer.review_confirmation(@review).deliver
        format.html { redirect_to root_path }
        flash[:success] = "Спасибо за Ваш отзыв. После модерации он будет опубликован"
      else
        format.html { render :new }
        flash[:danger] = "Заполните все поля"
      end
    end
  end


  private
    def review_params
      params.require(:review).permit(:name, :description, :product_id, :status)
    end

    def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
    end

    def set_cart
      @cart = current_cart
    end
end
