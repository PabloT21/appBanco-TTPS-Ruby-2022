class RenameScheduleColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :schedules, :lunesInicio, :lunes_inicio
    rename_column :schedules, :lunesFin, :lunes_fin
    rename_column :schedules, :martesInicio, :martes_inicio
    rename_column :schedules, :martesFin, :martes_fin
    rename_column :schedules, :miercolesInicio, :miercoles_inicio
    rename_column :schedules, :miercolesFin, :miercoles_fin
    rename_column :schedules, :juevesInicio, :jueves_inicio
    rename_column :schedules, :juevesFin, :jueves_fin
    rename_column :schedules, :viernesInicio, :viernes_inicio
    rename_column :schedules, :viernesFin, :viernes_fin
    rename_column :schedules, :sabadoInicio, :sabado_inicio
    rename_column :schedules, :sabadoFin, :sabado_fin
    rename_column :schedules, :domingoInicio, :domingo_inicio
    rename_column :schedules, :domingoFin, :domingo_fin
  end
end