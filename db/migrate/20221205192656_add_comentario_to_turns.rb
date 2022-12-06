class AddComentarioToTurns < ActiveRecord::Migration[7.0]
  def change
    add_column :turns, :comentario, :string
  end
end
