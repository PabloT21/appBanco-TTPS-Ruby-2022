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

end
