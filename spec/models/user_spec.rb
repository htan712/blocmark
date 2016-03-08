require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { create(:user) }

  it { should have_many(:topics) }
  it { should have_many(:bookmarks) }

  describe "attributes" do
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "should respond to admin" do
      expect(user).to respond_to(:admin)
    end
  end
end
