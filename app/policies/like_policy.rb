class LikePolicy
  attr_reader :current_user, :like

  def initialize(current_user, like)
    @current_user = current_user
    @like = like
  end

  def create?
    @current_user.present?
  end

  def new?
    create?
  end

  def destroy?
    @like.user == current_user
  end
end
