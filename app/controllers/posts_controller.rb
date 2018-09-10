class PostsController < ApplicationController
	before_action :set_category

  def index
    @posts = Post.all
  end

  def show
    @post = Post.friendly.find(params[:id])
    @posts = Post.where("id != #{@post.id}").sample(4)
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @reviews = Review.where("status = 'Показать'").sample(3)
      @contact = Contact.first
      @q = Product.search(params[:q])
    end

end
