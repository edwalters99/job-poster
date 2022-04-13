class RemoveImage3FromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :image_3, :text
  end
end
