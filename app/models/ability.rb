# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Post, user_id: user.id
    can :manage, Comment, user_id: user.id
    can :read, :all
    return unless user.admin?

    can :delete, Post
    can :delete, Comment
  end
end

#  user ||= User.new
#     can :manage, :all
#     if user.admin?
#       can :manage, :all
#     else
#       can :manage, Post, author_id: user.id
#       can :manage, Comment, author_id: user.id
#       can :read, :all
#     end