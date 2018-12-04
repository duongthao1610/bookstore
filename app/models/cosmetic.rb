class Cosmetic < ApplicationRecord
  searchkick highlight: [:name]
  has_many :comments
  has_many :likes_from_users, class_name: Emotion.name, dependent: :destroy
  has_many :users_liked, through: :likes_from_users, source: :user
  has_many :cart_items, dependent: :destroy
  has_many :users_added_to_cart, through: :cart_items, source: :user, dependent: :destroy
  belongs_to :category
  belongs_to :trademark
  mount_uploader :image, PictureUploader

  scope :order_by_created, -> {order created_at: :desc}
  scope :most_liked, -> { order(like: :desc).limit(15) }
  scope :select_cosmetic, -> {select :id, :name, :price, :description}
  scope :search_by_name, (lambda do |name|
    where("name LIKE ?", "%#{name}%") unless name.nil?
  end)
  scope :filter_by_cosmetic_type, -> category_name {Cosmetic.includes(:category)
    .where(categories: {name: category_name}) unless category_name.nil?}

  def search_data
    {
      name: name
    }
  end
  class << self
    delegate :search, to: :Searchkick if self.public_instance_methods.include?(:search)

  def to_xls(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |cosmetic|
        csv << cosmetic.attributes.values_at(*column_names)
      end
    end
  end
end
end

Cosmetic.reindex
