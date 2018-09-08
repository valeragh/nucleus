class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_category

  def edit
    @user = current_user
  end

  def update_password
    @user = current_user
    respond_to do |format|
	    if @user.update(user_params)
	      bypass_sign_in(@user)
	      format.html { redirect_to root_path }
	      flash[:success] = "Ваш пароль обновлен"
	    else
	      format.html { render "edit" }
	    end
	  end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

   def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
      @q = Product.search(params[:q])
    end
end