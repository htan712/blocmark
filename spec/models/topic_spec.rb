require 'rails_helper'

RSpec.describe Topic, type: :model do
  let (:topic) { create(:topic) }

  it { should belong_to(:user) }
end
