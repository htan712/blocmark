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

    it "responds to role" do
      expect(user).to respond_to(:role)
    end

    it "responds to admin?" do
      expect(user).to respond_to(:admin?)
    end

    it "responds to member?" do
      expect(user).to respond_to(:member?)
    end

    it "responds to moderator?" do
      expect(user).to respond_to(:moderator?)
    end
  end

  describe "roles" do
    it "is member by default" do
      expect(user.role).to eql("member")
    end

    context "member user" do
      it "returns true for #member?" do
        expect(user.member?).to be_truthy
      end

      it "retruns false for #admin? & #moderator?" do
        expect(user.moderator?).to be_falsey
        expect(user.admin?).to be_falsey
      end
    end

    context "admin user" do
      before do
        user.admin!
      end

      it "returns true for #admin?" do
        expect(user.admin?).to be_truthy
      end

      it "retruns false for #admin? & #moderator?" do
        expect(user.member?).to be_falsey
        expect(user.moderator?).to be_falsey
      end
    end

    context "moderator user" do
      before do
        user.moderator!
      end

      it "returns true for #moderator?" do
        expect(user.moderator?).to be_truthy
      end

      it "retruns false for #admin? & #member?" do
        expect(user.member?).to be_falsey
        expect(user.admin?).to be_falsey
      end
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
