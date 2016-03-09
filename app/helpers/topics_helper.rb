module TopicsHelper
  def user_is_authorized_for_topic?(topic)
    current_user == topic.user && current_user.admin?
  end
end
