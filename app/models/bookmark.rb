class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :user, presence: true
  validates :title, length: {minimum: 1}, presence: true
  validates :description, length: {minimum: 5, maximum: 200}, presence: true
  validates :url, presence: true
  validates :topic, presence: true
end
