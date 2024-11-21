class AddColumnTag < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :tag, :string
  end
end
