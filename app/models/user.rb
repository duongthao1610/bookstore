class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  scope :created_at, -> {order(created_at: :desc)}
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
  has_many :likes_for_book, class_name: Emotion.name, dependent: :destroy
  has_many :favorite_books, through: :likes_for_book, source: :book, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :books_in_cart, through: :cart_items, source: :book, dependent: :destroy
  has_many :orders, dependent: :destroy
  belongs_to :payment
  enum role: %i{member admin guest}

  def self.from_omniauth(auth)
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

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.google_data"] &&
        session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  # before_save :email_downcase
  # validates :name, presence: true,
  #   length: {maximum: Settings.user.max_name_size}
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true,
  #   length: {maximum: Settings.user.max_email_size},
  #   format: {with: VALID_EMAIL_REGEX},
  #   uniqueness: {case_sensitive: false}
  # has_secure_password
  # validates :password, presence: true,
  #   length: {minimum: Settings.user.min_password_size}

  # def User.digest string
  #   cost = ActiveModel::SecurePassword.min_cost ?
  #     bCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  #   BCrypt::Password.create string, cost: cost
  # end

  # def User.new_token
  #   SecureRandom.urlsafe_base64
  # end

  # def remember
  #   self.remember_token = User.new_token
  #   update remember_digest: User.digest(remember_token)
  # end

  # def authenticated? attribute, token
  #   digest = self.send("#{attribute}_digest")

  #   return false unless !digest.nil?
  #   Bcrypt::Password.new(digest).is_password?(token)
  # end

  # def forget
  #   update remember_digest: nil
  # end

  def cart_total
    total = 0
    self.cart_items.each { |item| total += item.paideach * item.quantity }
    return total
  end

  def add_to_cart(book)
    books_in_cart << book
  end

  def delete_from_cart(book)
    books_in_cart.delete(book)
  end

  def like(book)
    favorite_books << book
  end

  def unlike(book)
    favorite_books.delete(book)
  end

  def liked?(book)
    favorite_books.include?(book)
  end

  # private

  # def email_downcase
  #   email.downcase!
  # end
end
