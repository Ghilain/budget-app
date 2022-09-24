class Ability
  include CanCan::Ability

  def initialize(user)

    user || User.new
    if user.admin? :admin
      can :manage, :all
    else
      can :manage, Category, author_id: user.id
      can :manage, Payment, author_id: user.id
    end
  end
end
