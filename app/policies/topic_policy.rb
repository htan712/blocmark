class TopicPolicy
  before_action :admin?
  attr_reader :current_user, :topic

  def initialize(current_user, topic)
    @current_user = current_user
    @topic = topic
  end

  def new?
  end

  def create?
  end

  def edit?
  end

  def update?
  end

  def destroy?
  end

  private

  def admin?
    @current_user.admin?
  end


end
