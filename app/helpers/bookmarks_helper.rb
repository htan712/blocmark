module BookmarksHelper
  def user_is_authorized_for_bookmark?(bookmark)
    current_user == bookmark.user || current_user.admin?
  end
end
