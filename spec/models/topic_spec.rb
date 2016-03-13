require 'rails_helper'

RSpec.describe Topic, type: :model do
  let (:topic) { create(:topic) }
  let (:user) { create(:user) }

  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }

  describe "attributes" do
    it "should respond to title" do
      expect(topic).to respond_to(:title)
    end
  end
end
