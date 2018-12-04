class Category < ApplicationRecord
  has_many :cosmetics, dependent: :destroy
  scope :select_categories, -> {select :id, :name}
end
