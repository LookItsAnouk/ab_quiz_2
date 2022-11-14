class Ability
    include CanCan::Ability

    def initialize(user)

    user ||= User.new #guest user (not logged in)

    if user.present?
        can :create, :update, :destroy, :all
    else
        can :read, :all
    end

    alias_action :create, :read, :update, :delete, :to => :crud

    can :crud, Idea do |idea|
        user == idea.user
      end
  
    can :crud, Review do |review|
        user == review.user 
    end
  
    end
end