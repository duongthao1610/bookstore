class BooksController < ApplicationController
  before_action :load_book, only: :show
  before_action :load_categories, only: :index

  def show
    @comment = Comment.new
    @comments = @book.comments.order_by_created
    @cart_item = CartItem.new
  end

  def index
    @search = Book.ransack(params[:q])
    @pagy, @books = pagy @search.result.includes(:category)

    if params[:category]
      @pagy, @books = pagy Book.order_by_created.filter_by_book_type(params[:category])
    elsif params[:search_book]
      @pagy, @books = pagy_searchkick(Book.search(params[:search_book],
        {fields: [:title], highlight: true}))

    elsif params[:term]
      @books = Book.search_by_title(params[:term])
      render json: @books.map(&:title)
    end
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
  end
end
