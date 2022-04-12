class User < ApplicationRecord
    validates :first_name, :presence => true
    validates :email, :presence => true, :uniqueness => true
    has_secure_password
   
    has_many :jobs
    has_many :comments

    geocoded_by :address
    after_validation :geocode, :if => lambda { |obj| obj.address_num_changed? && obj.address_street_changed?  && obj.address_suburb_changed? && obj.address_postcode_changed? && obj.address_city_changed? && obj.address_country_changed?}



    def address #helper function for geocoding
        [address_num, address_street,
        address_suburb,
        address_postcode,
        address_city,
        address_country].compact.join(', ')
    end
end