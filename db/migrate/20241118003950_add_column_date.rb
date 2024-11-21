class AddColumnDate < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :date, :datetime
  end
end
