class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :date, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :body, presence: true

  scope :select_blog, ->{select :id, :title, :date, :author, :auth_link, :description}
  scope :order_by_created, ->{order created_at: :desc}
end
