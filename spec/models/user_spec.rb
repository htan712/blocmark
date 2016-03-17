require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { create(:user) }

  it { should have_many(:topics) }
  it { should have_many(:bookmarks) }
  it { should have_many(:likes) }


  describe "attributes" do
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to admin" do
      expect(user).to respond_to(:admin)
    end
  end

  describe "liked(bookmark)" do
    before do
      topic = Topic.create!(title: "blockmark", user: user)
      @bookmark = topic.bookmarks.create!(title: Faker::StarWars.character, description: Faker::StarWars.quote, url: "www.starwars.com", user: user)
    end

    it "returns nil if user has not liked the bookmark" do
      expect(user.liked(@bookmark)).to be_nil
    end

    it "returns like if it exists" do
      like = user.likes.where(bookmark: @bookmark).create
      expect(user.liked(@bookmark)).to eq(like)
    end
  end
end
