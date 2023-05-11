module DashboardHelper
  def show_sucursal_name(id)
    @sucursal = Sucursal.find(id)
    @sucursal.nombre
  end
end