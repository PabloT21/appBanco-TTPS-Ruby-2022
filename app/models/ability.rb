# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Client user permissions

    #Turn Permissions
    if user.cliente?

      can :passwordForm, AdminFormController
      can :read, Turn, creador_id: user.id
      can :create, Turn
      can :destroy, Turn, creador_id: user.id, state: 0
      can :update, Turn, creador_id: user.id, state: 0

      #Sucursal Permissions
      can :read, Sucursal

    elsif user.empleado?
      # Employee user permissions
      can :passwordForm, AdminFormController

      can :update, Sucursal, id: user.sucursal_id 
      can :read, Sucursal

      can :finish, Turn, sucursal_id: user.sucursal_id, state: 0

      can :read, User
      can :read, Turn, sucursal_id: user.sucursal_id


    elsif user.admin?
      # Admin user permissions  
      can :createPrivUsers, :adForm

      can :read, :all
  
      can :manage, User
      can :manage, Sucursal
      can :manage, Schedule
    end

  end
end
