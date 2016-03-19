require 'rails_helper'
include FeaturesHelper

feature "liking bookmark" do
  background do
    my_user = create(:user)
    my_topic = create(:topic)
    my_bookmark = create(:bookmark, topic: my_topic, user: my_user)
    sign_in_with my_user
  end

  scenario "allow user to like" do
    visit '/topics/1/bookmarks/1'
    click_on("Like")
    expect(page).to have_content("Unlike")
  end

  scenario "allow user to unlike" do
    visit '/topics/1/bookmarks/1'
    click_on("Like")
    click_on("Unlike")
    expect(page).to have_content("Like")
  end
end
