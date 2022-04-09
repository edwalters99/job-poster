class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.text :title
      t.text :desc
      t.float :price
      t.text :image_1
      t.text :image_2
      t.text :image_3
      t.boolean :completed
      t.boolean :has_comments

      t.timestamps
    end
  end
end
