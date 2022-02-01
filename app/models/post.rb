class Post < ApplicationRecord
  has_many :comments


  validates :category, presence: true
  validates :content, presence: true
end
