class Topic < ActiveRecord::Base
  belongs_to :user

  has_many :bookmarks

  validates :user, presence: true
  validates :title, length: {minimum: 1, maximum: 50}, presence: true

end
