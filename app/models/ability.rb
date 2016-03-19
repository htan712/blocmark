class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    alias_action  :read, :update, :to => :rd
    alias_action  :update, :destroy, :to => :ud

    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :rd, :all
      can :create, Bookmark
      can :destroy, Bookmark do |bookmark|
        bookmark.try(:user) == user
      end
    elsif user.member?
      can :create, Bookmark
      can :ud, Bookmark do |bookmark|
        bookmark.try(:user) == user
      end
    end


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
