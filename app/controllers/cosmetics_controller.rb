class CosmeticsController < ApplicationController
  before_action :load_cosmetic, only: :show
  before_action :load_categories, only: :index

  def show
    @comment = Comment.new
    @comments = @cosmetic.comments.order_by_created
    @cart_item = CartItem.new
  end

  def index
    @owl_cosmetics = Cosmetic.most_liked

    @search = Cosmetic.ransack(params[:q])
    @pagy, @cosmetics = pagy @search.result.includes(:category)

    if params[:category]
      @pagy, @cosmetics = pagy Cosmetic.order_by_created.filter_by_cosmetic_type(params[:category])
    elsif params[:search_cosmetic]
      @pagy, @cosmetics = pagy_searchkick(Cosmetic.search(params[:search_cosmetic],
        {fields: [:name], highlight: true, operator: "and"}))

    elsif params[:term]
      @cosmetics = Cosmetic.search_by_name(params[:term])
      render json: @cosmetics.map(&:name)
    end
  end

  private

  def load_cosmetic
    @cosmetic = Cosmetic.find_by id: params[:id]
    return if @cosmetic
  end
end
