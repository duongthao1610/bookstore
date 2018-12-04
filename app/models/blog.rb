class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  validates :title, presence: true
  validates :date, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :body, presence: true

  scope :select_blog, ->{select :id, :slug, :title, :date, :author, :auth_link, :description}
  scope :order_by_created, ->{order created_at: :desc}

  def should_generate_new_friendly_id?
    title_changed? || super
  end
end
