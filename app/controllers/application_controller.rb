class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CartsHelper

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.role?(:admin)
      flash[:alert] = 'Вы не авторизированы для данного ресурса!'
      redirect_to root_path
    end
  end


  

end
