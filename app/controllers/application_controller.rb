class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def logged_in_user
    return if user_signed_in?
    store_location
    flash[:danger] = I18n.t "require_login.please_login"
    redirect_to login_url
  end

  protected

  def configure_permitted_parameters
    attrs = [:email, :password, :password_confirmation, :avatar,
      :dob, :address, :phone_number, :payment_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: [attrs, :current_password])
  end

end
