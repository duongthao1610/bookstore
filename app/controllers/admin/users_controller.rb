class Admin::UsersController < Admin::BaseController
  before_action {flash.clear}

  def index
    @pagy, @users = pagy User.select_users.order_by_created_at
  end

  def destroy
    user = User.find_by id: params[:id]

    if user.is_admin?
      flash[:danger] = t ".cant"
    else
      flash[:success] = t ".success"
      User.delete(user)
    end
    @pagy, @users = pagy User.select_users.order_by_created_at
    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.js
    end
  end

end
