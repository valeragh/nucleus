class UserMailer < ApplicationMailer
	default from: "support@nucleus.com.ua"

  def order_user_confirmation(order)
    @order = order

    mail to: @order.user.email, subject: "Спасибо за ваш заказ №#{@order.id}"
  end

  def welcome(user, generated_password)
  	@user = user
  	@password = generated_password

  	mail to: @user.email, subject: "Регистрация в магазине Nucleus"
  end

end
