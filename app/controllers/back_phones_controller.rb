class BackPhonesController < ApplicationController
	before_action :set_category

  def new
  	@back_phone = BackPhone.new
  end

  def create
    @back_phone = BackPhone.new(back_phone_params)

    respond_to do |format|
      if @back_phone.save
        AdminMailer.back_phone_admin_confirmation(@back_phone).deliver_later
        #UserMailer.letter_confirmation(@back_phone).deliver
        format.html { redirect_to root_path }
        flash[:success] = "Спасибо за Ваше обращение, наши администраторы ответят Вам в ближайшее время"
      else
        format.html { render :new }
        flash[:danger] = "Заполните все поля"
      end
    end
  end

  private
    def back_phone_params
      params.require(:back_phone).permit(:name, :phone)
    end

    def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
      @q = Product.search(params[:q])
    end
end
