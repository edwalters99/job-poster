class ChangeJobImageToArray < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :image_1
    add_column :jobs, :images, :text, :array => true, :default => []
  end
end
