class Admin::CosmeticsController < Admin::BaseController
  before_action :load_cosmetic, only: %i(edit update)
  before_action :load_categories, :load_trademarks, except: %i(index destroy)
  before_action :reindex_cosmetic, only: %i(update destroy)

  def index
    @pagy, @cosmetics = pagy Cosmetic.order_by_created.search_by_name(params[:search])

    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @cosmetic = Cosmetic.new
  end

  def create
    @cosmetic = Cosmetic.new cosmetic_params

    if @cosmetic.save
      flash[:success] = t ".created_success"
      redirect_to admin_cosmetics_path
    else
      flash[:danger] = t ".created_fail"
      render :new
    end
  end

  def edit
  end

  def update

    if @cosmetic.update cosmetic_params
      flash[:success] = t ".updated_success"
      redirect_to admin_cosmetics_path
    else
      flash[:danger] = t ".updated_fail"
      render edit
    end
  end

  def destroy
    @cosmetic = Cosmetic.find_by id: params[:id]
    if @cosmetic.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".deleted_fail"
    end
    redirect_to admin_cosmetics_url
  end

  private

  def cosmetic_params
    params.require(:cosmetic).permit :name, :price, :quantity_in_store,
      :image, :description, :trademark_id, :category_id
  end

  def load_cosmetic
    @cosmetic = Cosmetic.find_by id: params[:id]

    return if @cosmetic
    flash[:danger] = t ".cosmetic_not_found"
    redirect_to admin_cosmetics_url
  end

  def load_categories
    @categories = Category.select_categories
  end

  def load_trademarks
    @trademarks = Trademark.all
  end

  def reindex_cosmetic
    Cosmetic.reindex
  end
end
