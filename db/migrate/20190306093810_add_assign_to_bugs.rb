class AddAssignToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :assign, :string
  end
end
