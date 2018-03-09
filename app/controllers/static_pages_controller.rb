class StaticPagesController < ApplicationController
  def index
  	@categories = Category.all.order(:rang)
  	@reviews = Review.where("status = 'Показать'").sample(3)
  end

  def about_us
  end

  def contacts
  end

  def faqs
  end
end
