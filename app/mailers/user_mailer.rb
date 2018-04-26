class UserMailer < ApplicationMailer
	default from: "support@nucleus.com.ua"

  def order_user_confirmation(order)
    @order = order

    mail to: @order.user.email, subject: "Спасибо за ваш заказ №#{@order.id}"
  end

end
