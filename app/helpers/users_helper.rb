module UsersHelper
  def payment_collection
    Payment.all
  end

  def current_user? user
    user == current_user
  end
end
