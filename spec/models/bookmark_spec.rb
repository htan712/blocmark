require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { create(:bookmark) }
  let(:topic) { create(:topic) }

  it { should belong_to(:topic) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:topic) }

  it { should validate_length_of(:title).is_at_least(1) }
  it { should validate_length_of(:description).is_at_least(5) }

  describe "attributes" do
    it "should respond to title" do
      expect(bookmark).to respond_to(:title)
    end
    it "should respond to url" do
      expect(bookmark).to respond_to(:url)
    end
    it "should respond to description" do
      expect(bookmark).to respond_to(:description)
    end
  end
end
