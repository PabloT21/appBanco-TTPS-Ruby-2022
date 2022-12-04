class AddFields < ActiveRecord::Migration[7.0]
  def change
    change_table(:turns) do |t|
        t.references :creador, foreign_key: { to_table: 'users' }
        t.references :empleados, foreign_key: { to_table: 'users' }
    end
  end
end
