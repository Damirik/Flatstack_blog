class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
  has_many :blogs, dependent: :destroy
  has_many :posts, through: :blogs
end
