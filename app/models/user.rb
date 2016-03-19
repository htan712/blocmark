class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  before_save {self.email = email.downcase}
  before_save {self.role ||= :member}

  enum role: [:member, :moderator, :admin]

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
