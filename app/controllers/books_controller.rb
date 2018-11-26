class BooksController < ApplicationController
  before_action :load_book, only: :show
  before_action :load_categories, only: :index

  def show
    @comment = Comment.new
    @comments = @book.comments.order_by_created
    @cart_item = CartItem.new
  end

  def index
    @books = Book.order_by_created.filter_by_book_type(params[:category])
      .page(params[:page]).per Settings.book.per_page
    @search = Book.ransack(params[:q])
    @books = @search.result.includes(:category).filter_by_price(params[:price_about]).page(params[:page]).per Settings.book.per_page
    if params[:search_book]
      @books = Book.search(params[:search_book], fields: [:title], highlight: true)
    elsif params[:term]
      @books = Book.search(params[:term])
      render json: @books.map(&:title)
    end
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
  end
end
