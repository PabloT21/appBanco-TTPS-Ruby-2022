class AgregarRoles < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rol, :string
    add_column :users, :sucursal_id
  end
end
