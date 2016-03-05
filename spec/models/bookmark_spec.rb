require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { create(:bookmark) }
  let(:topic) { create(:topic) }

  it { should belong_to(:topic)}
end
