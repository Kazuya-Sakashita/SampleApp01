class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[ github twitter google_oauth2 ]

  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarks_posts, through: :bookmarks, source: :post

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
    user
  end


  def own?(object)
    object.user_id == self.id  #selfは省略可
  end

  def bookmark(post)
    bookmarks_posts << post
  end

    # お気に入りを外す
  def unbookmark(post)
    bookmarks_posts.destroy(post)
  end

  # お気に入り登録しているか判定するメソッド
  def bookmark?(post)
    bookmarks_posts.include?(post)
  end
end
