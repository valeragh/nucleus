# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  def order_admin_confirmation
    AdminMailer.order_admin_confirmation(Order.first).deliver_now
  end

  def letter_admin_confirmation
    AdminMailer.letter_admin_confirmation(Letter.first).deliver_now
  end

  def review_admin_confirmation
    AdminMailer.review_admin_confirmation(Review.first).deliver_now
  end
end
