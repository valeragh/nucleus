class StaticPagesController < ApplicationController
  before_action :set_category

  def index
  end

  def about_us
  end

  def sitemap_html
    @posts = Post.all
    @services = Service.where(status: "Показать")
  end

  def price
    @products = Product.all.order(updated_at: :desc)
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_user_csv, filename: "price-#{Date.today}.csv" }
    end
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

  def terms_of_use
  end

  def privacy_policy
  end

  def sitemap
    path = Rails.root.join("public", "sitemaps", "sitemap.xml")
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end

  private
    def set_category
      @categories = Category.all.order(:rang)
      @reviews = Review.where("status = 'Показать'").sample(3)
      @contact = Contact.first
      @q = Product.search(params[:q])
    end
end
