class AddColumnsToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :sabadoInicio, :time
    add_column :schedules, :sabadoFin, :time
    add_column :schedules, :domingoInicio, :time
    add_column :schedules, :domingoFin, :time
  end
end
