class CreateSucursals < ActiveRecord::Migration[7.0]
  def change
    create_table :sucursals do |t|
      t.string :nombre
      t.string :dirección
      t.string :telefono
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sucursals, :nombre, unique: true
  end
end
