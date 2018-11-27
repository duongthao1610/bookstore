class FavoriteBooksController < ApplicationController
  before_action :load_user

  def index
    @pagy, @books = pagy @user.favorite_books
  end

  private

  def load_user
    @user = User.find_by id: params[:user_id]

    return if @user
    flash[:danger] = t ".user_not_found"
    redirect_to root_url
  end

end
