class DelayJob
  include SuckerPunch::Job

  def perform(user, generated_password)
    UserMailer.welcome(user, generated_password).deliver_now
  end
end