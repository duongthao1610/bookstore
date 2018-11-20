module BooksHelper
  def load_categories
    @categories = Category.all
  end

  def load_authors
    @authors = Author.select_author
  end
end
