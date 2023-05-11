class DashboardController < ApplicationController

def index ; end

def main; end

def profile; end


def indexUsers
    authorize! :read, :userList
    if (current_user.empleado?)
        @users = User.where(rol: ["usuario"])
    elsif current_user.admin?
        @users = User.all
    end
end

def passwordForm; end



def editEmpleado
    authorize! :update, :userSucursal 
    @sucursals = Sucursal.all
    @usuario = User.find(params[:user_id])

end

def updateSucursal
    status = true
    authorize! :update, :userSucursal 
    if params[:idSucursal].blank?
        status = false
        flash[:errorF] = "Tenes que ingresar una sucursal"
    else
        @sucursal = Sucursal.find(params[:idSucursal])
        if (@sucursal.blank?)
            status = false
            flash[:errorF] = "No existe esa sucursal"
        end
    end
    if (status)
        @user = User.find(params[:usuario_id])
        @user.sucursal_id = params[:idSucursal]
        if (@user.save)
            redirect_to "/editEmpleado", :notice => 'Se modifico la sucursal correctamente!'
        else
            flash[:errorF] = "Lo sentimos! Algo salio mal"
            redirect_to "/editEmpleado"
        end
    else
        redirect_to "/editEmpleado"
    end
end


def updatePassword
    @user = User.find(current_user.id)
    status = true
    if (params[:password].blank? || params[:passwordConfirmation].blank?)
        status = false
        flash[:errorF] = "No podes dejar campos vacios"
    elsif (not params[:password] == params[:passwordConfirmation])
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
            redirect_to "/passwordForm"
        end
    else
        redirect_to "/passwordForm"
    end
end

end
