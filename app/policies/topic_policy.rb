class TopicPolicy
  attr_reader :current_user, :topic

  def initialize(current_user, topic)
    @current_user = current_user
    @topic = topic
  end

  def new?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def edit?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end
end
