class CommentChanges < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :goal_id, :integer, null: false
  end
end
