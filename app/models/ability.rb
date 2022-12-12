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
      can :read, Sucursal

    elsif user.empleado?
      # Employee user permissions
      can :passwordForm, AdminFormController

      can :read, Sucursal

      can :finish, Turn, sucursal_id: user.sucursal_id, state: 0

      can :read, :userList

      can :read, User
      can :read, Turn, sucursal_id: user.sucursal_id


    elsif user.admin?
      # Admin user permissions 
      can :update, :userSucursal 
      can :passwordForm, AdminFormController

      can :createPrivUsers, :adForm

      can :read, :userList


      can :read, :all
  
      can :manage, User
      can :manage, Sucursal
      can :manage, Schedule
    end

  end
end
