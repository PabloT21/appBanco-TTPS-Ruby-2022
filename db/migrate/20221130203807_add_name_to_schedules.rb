class AddNameToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :name, :string
    add_index :schedules, :name, unique: true
  end
end
