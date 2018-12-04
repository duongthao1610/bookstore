class Emotion < ApplicationRecord
  belongs_to :user
  belongs_to :cosmetic
  validates :user_id, presence: true
  validates :cosmetic_id, presence: true
end
