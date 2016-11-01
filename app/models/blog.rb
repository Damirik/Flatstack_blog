class Blog < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :subject, presence: true
end
