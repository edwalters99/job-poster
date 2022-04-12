class RemoveHasCommentsFromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :has_comments, :boolean
  end
end
