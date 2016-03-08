module TopicsHelper
  def user_is_authorized_for_topic?(topic)
    current_user == topic.user && topic.user.admin?
  end
end
