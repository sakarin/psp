class Ability
  include CanCan::Ability

  def initialize(user)


    user ||= User.new

    # Role Inheritance


    #ROLES = %w[admin can_orders can_manufactures can_factories can_stocks can_sents can_database can_history can_setting]

    if user.role? :admin
       can :manage, :all
    end
    if user.role? :can_orders
       can :manage, Order
    end
    if user.role? :can_manufactures
       can [:read, :create, :update], Manufacture
    end
    if user.role? :can_factories
       can [:read, :create, :update], Invoice
    end

    if user.role? :can_stocks
       can [:read, :create, :update], Stock
    end

    if user.role? :can_sents
       can [:read, :create, :update], Sent
    end


    if user.role? :can_database

    end

    if user.role? :can_history

    end

    if user.role? :can_setting

    end





  end
end
