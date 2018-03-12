class Users::SessionsController < Devise::SessionsController
  before_action :set_category
  #before_filter :disable_nav, only: [:new]
  # before_action :configure_sign_in_params, only: [:create]

  def create
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private
    def set_category
      @categories = Category.all.order(:rang)
      @contact = Contact.first
    end
end
