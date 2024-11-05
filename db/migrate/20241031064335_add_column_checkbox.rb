class AddColumnCheckbox < ActiveRecord::Migration[7.2]
  def change
    add_column :todos, :checkbox, :boolean, null: false, default: false
  end
end
