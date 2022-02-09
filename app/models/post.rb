class Post < ApplicationRecord
  has_many :comments

  validates :category, presence: true
  validates :content, presence: true
  # validates :user_id, {presence: true}

  belongs_to :user

end
