class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
      cannot :destroy, User do |user|
        user.admin?
      end
    else user.member?
      can :read, :all
      can [:create, :destroy], [Comment, Emotion, Order], user_id: user.id
      can [:create], Blog
    end
  end
end
