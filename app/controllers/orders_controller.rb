class OrdersController < ApplicationController
  before_action {flash.clear}

  def index
    @pagy, @orders = pagy current_user.orders
  end

  def show
    @order = Order.find_by id: params[:id]
  end

  def new
    @pagy, @items = pagy current_user.cart_items
    @order = Order.new
    @payments = Payment.all
    @user= current_user
  end

  def create
    @order = Order.new order_params
    if check_info(@order)
      flash[:danger] = t ".pls_update"
      respond_to do |format|
      format.html { redirect_to new_order_path }
      format.js
    end
    else
      @order.save
      flash[:success] = t ".order_success"
      redirect_to @order
    end
  end

  private

  def order_params
    params.require(:order).permit :name, :date,
      :phone_number, :dob, :address, :payment_id, :user_id, :total
  end

  def check_info(order)
    order.name.blank? || order.dob.blank? || order.payment_id.blank? || order.address.blank? || order.phone_number.blank?
  end
end
