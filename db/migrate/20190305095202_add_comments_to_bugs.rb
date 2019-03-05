class AddCommentsToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :comment, :string
  end
end
