class AddUsernameToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :username, :string
  end
end
