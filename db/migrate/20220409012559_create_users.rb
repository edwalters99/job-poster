class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.string :password_digest
      t.string :address_num
      t.string :address_street
      t.string :address_suburb
      t.string :address_city
      t.string :address_country
      t.string :address_postcode
      t.string :phone
      t.float :latitude
      t.float :longitude
      t.boolean :can_post
      t.boolean :admin

      t.timestamps
    end
  end
end
