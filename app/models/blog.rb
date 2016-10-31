class Blog < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :subject, presence: true
end
