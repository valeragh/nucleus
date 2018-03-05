class StaticPagesController < ApplicationController
  def index
  	@categories = Category.all.order(:rang)
  end

  def about_us
  end

  def contacts
  end

  def faqs
  end
end
