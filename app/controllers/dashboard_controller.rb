class DashboardController < ApplicationController

  def index 
  end

  def main
  end

  def profile
  end

  def index_users
    authorize! :read, :user_list
    if (current_user.empleado?)
      @users = User.where(rol: ["usuario"])
    elsif current_user.admin?
      @users = User.all
    end
  end 

  def password_form
  end


  def edit_empleado
    authorize! :update, :user_sucursal 

    @sucursals = Sucursal.all
    @usuario = User.find(params[:user_id])
  end

  def update_sucursal
    status = true
    authorize! :update, :user_sucursal 
    if params[:sucursal_id].blank?
      status = false
      flash[:errorF] = "Tenes que ingresar una sucursal"
    else
      @sucursal = Sucursal.find(params[:sucursal_id])
      if (@sucursal.blank?)
        status = false
        flash[:errorF] = "No existe esa sucursal"
      end
    end
    if (status)
      @user = User.find(params[:usuario_id])
      @user.sucursal_id = params[:sucursal_id]
      if (@user.save)
        redirect_to "/edit_empleado", :notice => 'Se modifico la sucursal correctamente!'
      else
        flash[:errorF] = "Lo sentimos! Algo salio mal"
        redirect_to "/edit_empleado"
      end
    else
      redirect_to "/edit_empleado"
    end
  end

  def update_password
    @user = User.find(current_user.id)
    status = true
    if (params[:password].blank? || params[:errorF].blank?)
      status = false
      flash[:errorF] = "No podes dejar campos vacios"
    elsif (not params[:password] == params[:password_confirmation])
      status = false
      flash[:errorF] = "Las contraseñas deben coincidir"
    end
    if (status)
      password = params[:password]
      encrypted_password = User.new.send(:password_digest, password)
      @user.encrypted_password = encrypted_password
      if (@user.save)
        redirect_to "/profile", :notice => 'Se modifico tu contraseña correctamente!'
      else
        flash[:errorF] = "Lo sentimos! Algo salio mal"
        redirect_to "/password_form"
      end
    else
      redirect_to "/password_form"
    end
  end
end
