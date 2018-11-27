class BooksController < ApplicationController
  before_action :load_book, only: :show
  before_action :load_categories, only: :index

  def show
    @q = Book.ransack(params[:q])
    @comment = Comment.new
    @comments = @book.comments.order_by_created
    @cart_item = CartItem.new
  end

  def index
    @pagy, @books = pagy Book.order_by_created.filter_by_book_type(params[:category])

      @search = Book.ransack(params[:q])
      @pagy, @books = pagy @search.result.includes(:category)
    if params[:term]
      @search = Book.ransack(title_cont: params[:term], category_name_eq: params[:q][:category_name_eq])
      @books = @search.result.includes(:category)
      render json: @books.map(&:title)
    end
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
  end
end
