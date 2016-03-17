class Topic < ActiveRecord::Base
  belongs_to :user

  has_many :bookmarks, dependent: :destroy

  validates :user, presence: true
  validates :title, length: { minimum: 3, maximum: 50 }, presence: true


  default_scope { order('title ASC')}
end
