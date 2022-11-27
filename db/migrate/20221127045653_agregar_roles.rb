class AgregarRoles < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rol, :string
  end
end
