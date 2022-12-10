class MakeSucursalNullable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :sucursal_id, :integer, null: true
  end
end
