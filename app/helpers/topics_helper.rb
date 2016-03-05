module TopicsHelper
  def user_is_authorized_for_topic?
    current_user == @topic.user
  end
end
