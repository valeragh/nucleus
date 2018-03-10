class LettersController < ApplicationController
  before_action :set_category

  def new
  	@letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)

    respond_to do |format|
      if @letter.save
        #UserMailer.letter_admin_confirmation(@letter).deliver
        #UserMailer.letter_confirmation(@letter).deliver
        format.html { redirect_to root_path }
        flash[:success] = "Спасибо за Ваше обращение, наши администраторы ответят Вам в ближайшее время"
      else
        format.html { render :new }
        flash[:danger] = "Заполните все поля"
      end
    end
  end

  private
    def letter_params
      params.require(:letter).permit(:name, :description, :email, :status)
    end

    def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
    end
end
