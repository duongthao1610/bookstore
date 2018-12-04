class FavoriteCosmeticsController < ApplicationController
  before_action :load_user

  def index
    @pagy, @cosmetics = pagy @user.favorite_cosmetics
  end

  private

  def load_user
    @user = User.find_by id: params[:user_id]

    return if @user
    flash[:danger] = t ".user_not_found"
    redirect_to root_url
  end

end
