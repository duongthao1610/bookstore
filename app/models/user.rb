class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i(google_oauth2)
  scope :order_by_created_at, -> {order created_at: :desc}
  scope :select_users, -> {select :name, :dob, :email, :address, :avatar, :id}
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  mount_uploader :avatar, PictureUploader
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes_for_cosmetic, class_name: Emotion.name, dependent: :destroy
  has_many :favorite_cosmetics, through: :likes_for_cosmetic, source: :cosmetic, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :cosmetics_in_cart, through: :cart_items, source: :cosmetic, dependent: :destroy
  has_many :orders, dependent: :destroy
  belongs_to :payment
  enum role: %i{member admin guest}

  def cart_total
    total = 0
    self.cart_items.each { |item| total += item.paideach * item.quantity }
    return total
  end

  def add_to_cart cosmetic
    cosmetics_in_cart << cosmetic
  end

  def delete_from_cart cosmetic
    cosmetics_in_cart.delete(cosmetic)
  end

  def like cosmetic
    favorite_cosmetics << cosmetic
    cosmetic.update_attributes like: cosmetic.like + 1
  end

  def unlike cosmetic
    favorite_cosmetics.delete(cosmetic)
    cosmetic.update_attributes like: cosmetic.like - 1
  end

  def liked? cosmetic
    favorite_cosmetics.include?(cosmetic)
  end

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.avatar = auth.info.image
        user.payment_id = 1
      end
    end

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.google_data"] &&
          session["devise.google_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end
end
