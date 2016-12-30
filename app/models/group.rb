class Group < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :title, presence: true
  has_many :group_relationship
  has_many :members, through: :group_relationship, source: :user
end
