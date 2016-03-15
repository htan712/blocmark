class BookmarkPolicy
  attr_reader :current_user, :bookmark

  def initialize(current_user, bookmark)
    @current_user = current_user
    @bookmark = bookmark
  end

  def create?
    @current_user.present?
  end

  def new?
    create?
  end

  def destroy?
    @current_user.admin? || @bookmark.user == current_user
  end
  
end
