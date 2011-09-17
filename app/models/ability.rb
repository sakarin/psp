class Ability
  include CanCan::Ability

  def initialize(user)


    user ||= User.new

    if user.role? :admin
      can :manage, :all
      #can :update, Comment do |comment|
      #  comment.try(:user) == user || user.role?(:moderator)
      #end
      #can :manage, Manufacture do |manufacture|
      #  manufacture.try(:user) == user
      #end
      #can :manage, Order
      #can :manage, Manufacture, :order_id => order.id
      #can :access, :manufactures, :order_id => order.id
    else
      can :read, Order
      #can :create, Comment
      #can :update, Comment do |comment|
      #  comment.try(:user) == user
      #end
    end
  end
end
