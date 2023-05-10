class AddSucursalToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :sucursal, foreign_key: true
  end
end
