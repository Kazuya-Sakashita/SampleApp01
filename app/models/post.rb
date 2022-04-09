class Post < ApplicationRecord
  include AASM

  aasm column: :post_published_state, timestamps: true do
    state :personal, initial: true
    state :share

    event :share do
      transitions from: :personal, to: :share
    end

    event :personal do
      transitions from: :share, to: :personal
    end
  end



  has_many :comments

  validates :category, presence: true
  validates :content, presence: true
  # validates :user_id, {presence: true}

  belongs_to :user, optional: true
  has_many :bookmarks, dependent: :destroy 

end
