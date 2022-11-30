class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.time :lunesInicio
      t.time :lunesFin
      t.time :martesInicio
      t.time :martesFin
      t.time :miercolesInicio
      t.time :miercolesFin
      t.time :juevesInicio
      t.time :juevesFin
      t.time :viernesInicio
      t.time :viernesFin

      t.timestamps
    end
  end
end
