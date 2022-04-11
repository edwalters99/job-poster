class ChangePriceToInt < ActiveRecord::Migration[5.2]
  def change
    
    change_column :jobs, :price, :integer
  end
end
