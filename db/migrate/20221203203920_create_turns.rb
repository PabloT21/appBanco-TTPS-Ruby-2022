class CreateTurns < ActiveRecord::Migration[7.0]
  def change
    create_table :turns do |t|
      t.references :sucursal, null: false, foreign_key: true
      t.date :fecha
      t.string :reason
      t.integer :state

      t.timestamps
    end
  end
end
