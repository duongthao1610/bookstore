class ChartsController < ApplicationController
  def index
    @orders = Order.all
  end
end
