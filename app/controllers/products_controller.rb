class ProductsController < ApplicationController
	before_action :set_category
	before_action :authenticate_active_admin_user!

  def index
  	@products = Product.all.order(updated_at: :desc)
  	@import = Product::Import.new
    @price_import = Product::PriceImport.new
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv, filename: "products-#{Date.today}.csv" }
    end
  end

  def import
  	@import = Product::Import.new product_import_params
	  if @import.save
	  	redirect_to products_path, notice: "Загружено #{@import.imported_count} товаров"
	  else
      @products = Product.all.order(updated_at: :desc)
      flash[:alert] = "Есть ошибки #{@import.errors.count} с вашим CSV файлом"
	  	render action: :index
	  end
  end

  def price_import
    @import = Product::Import.new
    @price_import = Product::PriceImport.new product_price_import_params
    if @price_import.save
      redirect_to products_path, notice: "Загружено #{@price_import.imported_count} товаров"
    else
      @products = Product.all.order(updated_at: :desc)
      flash[:alert] = "Есть ошибки #{@price_import.errors.count} с вашим CSV файлом"
      render action: :index
    end
  end

  private
    def product_import_params
    	params.require(:product_import).permit(:file, :imported_count)
    end

    def product_price_import_params
      params.require(:product_price_import).permit(:file, :imported_count)
    end

    def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
      @q = Product.search(params[:q])
    end
end
