class Book < ApplicationRecord
  searchkick word_start: [:title], highlight: [:title]
  has_many :comments
  has_many :likes_from_users, class_name: Emotion.name, dependent: :destroy
  has_many :users_liked, through: :likes_from_users, source: :user
  has_many :cart_items, dependent: :destroy
  has_many :users_added_to_cart, through: :cart_items, source: :user, dependent: :destroy
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  belongs_to :category
  mount_uploader :image, PictureUploader

  scope :order_by_created, -> {order created_at: :desc}
  scope :select_book, -> {select :id, :title, :price, :description}
  scope :filter_by_book_type, -> category_name {Book.includes(:category)
    .where(categories: {name: category_name}) unless category_name.nil?}

  def search_data
    {
      title: title
    }
  end

  class << self
    # delegate :search, to: :Searchkick if self.public_instance_methods.include?(:search)

  def to_xls(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |book|
        csv << book.attributes.values_at(*column_names)
      end
    end
  end
end
end

# Book.reindex
