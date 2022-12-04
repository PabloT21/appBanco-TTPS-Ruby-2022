module TurnsHelper

    def translateState(state)
        if state == 0
            "Pendiente"
        else
            "Atendido"
        end
    end

end
