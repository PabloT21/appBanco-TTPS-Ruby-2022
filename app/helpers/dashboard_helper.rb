module DashboardHelper
    def showSucursalName(id)
        @sucursal = Sucursal.find(id)
        @sucursal.nombre
    end
end
