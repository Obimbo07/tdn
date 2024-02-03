<<<<<<< HEAD
=======
# frozen_string_literal: true

# This helper provides methods for the homepage
>>>>>>> dcecf69b30970763751a1e57ac85f15bdcac83e5
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.is? :admin
      can :manage, :all
    else
      can :read, :all
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
    end
  end
end
