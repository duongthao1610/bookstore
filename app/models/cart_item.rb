class CartItem < ApplicationRecord
  belongs_to :cosmetic
  belongs_to :user
  validates :user_id, presence: true
  validates :cosmetic_id, presence: true
end
