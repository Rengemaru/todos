class AddSetDateToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :set_date, :string
  end
end
