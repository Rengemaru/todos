class AddColumnCheckbox < ActiveRecord::Migration[7.2]
  def change
    add_column :todos, :checkbox, :boolean, default: false
  end
end
