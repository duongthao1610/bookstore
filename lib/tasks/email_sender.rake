namespace :email_sender do
  desc “Send email to users”
  task send_m: :environment do
    User.find_each do |user|
    UserMailer.happy_birthday(user).deliver_now
  end
end
