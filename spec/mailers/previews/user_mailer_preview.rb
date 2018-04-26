# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def order_user_confirmation
    UserMailer.order_user_confirmation(Order.first).deliver_now
  end
end
