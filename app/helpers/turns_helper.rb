module TurnsHelper

    def translate_state(state)
        if state == 0
            "Pendiente"
        else
            "Atendido"
        end
    end

    def get_porcentaje(state)
        if state == 0
            "50%"
        else
            "100%"
        end
    end

    def get_state_color(state)
        if state == 0
            "warning"
        else
            "success"
        end
    end

    def show_field?(state)
        if state == 0
            true
        else
            false
        end
    end

    def show_finish_turn?(state)
        if ((can? :finish, @turn) && show_field?(state) )
            true
        else
            false
        end 
    end

    def show_employee_email(id)
        @user = User.find(id)
        @user.email
    end

    def show_sucursal_name(id)
        @sucursal = Sucursal.find(id)
        @sucursal.nombre
    end

    def show_user_mail(id)
        @user = User.find(id)
        if (@user.blank?)
            "Usuario eliminado"
        else
            @user.email
        end
    end
end
