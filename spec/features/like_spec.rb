require 'rails_helper'
include UsersHelper


RSpec.feature "liking bookmark" do
  before :each do
    my_user = create(:user)
    my_topic = create(:topic)
    my_bookmark = create(:bookmark, topic: my_topic, user: my_user)
  end

  scenario "allow user to like" do
    visit '/topics/1/bookmarks/1'
    click_on("Like")
    expect(page).to have_content("Unlike")
  end
end
