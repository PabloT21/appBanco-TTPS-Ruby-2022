class CreateHorarios < ActiveRecord::Migration[7.0]
  def change
    create_table :horarios do |t|
      t.time :inicio
      t.time :fin

      t.timestamps
    end
  end
end
