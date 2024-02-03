# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :manage, Post, author_id: user.id
<<<<<<< HEAD
      can :manage, Comment, author_id: user.id
      can %i[create update destroy], Post, user_id: user.id
=======
      can :manage, Comment, user_id: user.id
      can :read, :all
>>>>>>> dd12021e3fe38eb1fe1bbee2acb7726f5ba37020
    end
  end
end
