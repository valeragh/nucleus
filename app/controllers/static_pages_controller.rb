class StaticPagesController < ApplicationController
  before_action :set_category
  before_action :set_cart

  def index
  end

  def about_us
  end

  def contacts
    @letter = Letter.new
    @contacts = Contact.where("status = 'Показать'")
    @hash = Gmaps4rails.build_markers @contacts do |contact, marker|
      marker.lat contact.latitude
      marker.lng contact.longitude
      marker.infowindow contact.description
    end
  end

  def faqs
    @faqs = Faq.all
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @reviews = Review.where("status = 'Показать'").sample(3)
      @contact = Contact.first
    end

    def set_cart
      @cart = current_cart
    end
end
