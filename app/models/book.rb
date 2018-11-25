require "elasticsearch/model"
class Book < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
      # indexes :publisher, analyzer: 'english'
      # indexes :price, analyzer: 'english'
      # indexes :quantity_in_store, analyzer: 'english'
      # indexes :image, analyzer: 'english'
      indexes :description, analyzer: 'english'
      # indexes :category_id, analyzer: 'english'
    end
  end
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
  scope :search_by_title, (lambda do |title|
    where("title LIKE ?", "%#{title}%") unless title.nil?
  end)
  scope :filter_by_book_type, -> category_name {Book.includes(:category)
    .where(categories: {name: category_name}) unless category_name.nil?}

  class << self
    delegate :search, to: :__elasticsearch__ if self.public_instance_methods.include?(:search)

    def to_xls(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |book|
          csv << book.attributes.values_at(*column_names)
        end
      end
    end

    def search query
      __elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: query,
              fields: ['title^10', 'content']
            }
          },
          highlight: {
            pre_tags: ['<em>'],
            post_tags: ['</em>'],
            fields: {
              title: {},
              content: {}
            }
          }
        }
      )
    end
  end
end
Book.__elasticsearch__.client.indices.delete index: Book.index_name rescue nil

# Create the new index with the new mapping
Book.__elasticsearch__.client.indices.create \
  index: Book.index_name,
  body: { settings: Book.settings.to_hash, mappings: Book.mappings.to_hash }

# Index all article records from the DB to Elasticsearch
Book.import force:true
