class Topic < ActiveRecord::Base
  belongs_to :user

  has_many :bookmarks

  validates :user, presence: true
  validates :title, presence: true

  default_scope { order('title ASC')}
end
