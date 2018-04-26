class AdminMailer < ApplicationMailer

  default from: "support@nucleus.com.ua"

  def letter_admin_confirmation(letter)
    @letter = letter

    mail to: "alinamagazin56@gmail.com", subject: "Новый вопрос от #{@letter.name}"
  end

  def order_admin_confirmation(order)
    @order = order

    mail to: "alinamagazin56@gmail.com", subject: "Новый заказ №#{@order.id}"
  end

  def review_admin_confirmation(review)
    @review = review

    mail to: "alinamagazin56@gmail.com", subject: "Новый отзыв от #{@review.name}"
  end

end
