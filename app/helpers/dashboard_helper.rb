module DashboardHelper
  def show_sucursal_name(id)
    @branch_office = Sucursal.find(id)
    @branch_office.nombre
  end
end