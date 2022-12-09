class DashboardController < ApplicationController

def index 
end

def main
end

def profile
end

def indexUsers
    @users = User.where(rol: ["usuario"])
end

def passwordForm
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
