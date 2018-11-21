class MinuteWorker
  include Sidekiq::Worker
  MAIL_MINUTE = 1

  def perform user
    # @user = User.last
    # send_email_when_end_minute @user
    UserMailer.happy_birthday(user).deliver_now
  end

  private

  def send_email_when_end_minute user
    UserMailer.happy_birthday(user).deliver_now
  end
end
