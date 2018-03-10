class StaticPagesController < ApplicationController
  before_action :set_category

  def index
  end

  def about_us
  end

  def contacts
    @letter = Letter.new
  end

  def faqs
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @reviews = Review.where("status = 'Показать'").sample(3)
    end
end
