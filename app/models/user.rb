class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :full_name, presence: true
  has_many :blogs, dependent: :destroy
  has_many :posts, through: :blogs
  has_many :comments, through: :posts

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
      unless user
        user = User.create(full_name: data["name"],
                           email: data["email"],
                           password: Devise.friendly_token[0,20])
      end
    user
  end
end
