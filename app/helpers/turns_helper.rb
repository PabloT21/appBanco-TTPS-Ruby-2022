module TurnsHelper

    def translateState(state)
        if state == 0
            "Pendiente"
        else
            "Atendido"
        end
    end

    def getPorcentaje(state)
        if state == 0
            "50%"
        else
            "100%"
        end
    end

    def getStateColor(state)
        if state == 0
            "warning"
        else
            "success"
        end
    end

    def showField?(state)
        if state == 0
            true
        else
            false
        end
    end

    def showFinishTurn?(state)
        if ((can? :finish, @turn) && showField?(state) )
            true
        else
            false
        end 
    end

    def showEmployeeEmail(id)
        @user = User.find(id)
        @user.email
    end

    def showSucursalName(id)
        @sucursal = Sucursal.find(id)
        @sucursal.nombre
    end

    def getDefaultSucursal(turn)
        if(turn.sucursal_id.blank?)
            ""
        else
            turn.sucursal_id.to_s
        end
    end
end
