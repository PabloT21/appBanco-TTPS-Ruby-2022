# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    # Client user permissions

    #Turn Permissions
    if user.cliente?

      can :password_form, AdminFormController
      can :read, Turn, creador_id: user.id
      can :create, Turn
      can :destroy, Turn, creador_id: user.id, state: 0
      can :update, Turn, creador_id: user.id, state: 0
      can :read, Sucursal

    elsif user.empleado?
      # Employee user permissions
      can :password_form, AdminFormController

      can :read, Sucursal

      can :finish, Turn, sucursal_id: user.sucursal_id, state: 0

      can :read, :user_list

      can :read, User
      can :read, Turn, sucursal_id: user.sucursal_id

    elsif user.admin?
      # Admin user permissions 
      can :update, :user_sucursal 
      can :password_form, AdminFormController

      can :create_priv_users, :ad_form

      can :read, :user_list

      can :read, :all
  
      can :manage, User
      can :manage, Sucursal
      can :manage, Schedule
    end
  end
end