class AddAssignedToToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :assigned_to, :integer
  end
end
