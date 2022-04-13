class RemoveImage2FromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :image_2, :text
  end
end
