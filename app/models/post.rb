class Post < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  has_many :comments
  validates :title, presence: true
end
