class User < ApplicationRecord
    validates :first_name, :presence => true
    validates :email, :presence => true, :uniqueness => true
    validates :password, :length => {:within => 6..40}, on: :create
    has_secure_password
    has_many :jobs
    has_many :comments
    Geocoder.configure
    geocoded_by :address
    after_validation :geocode

    def address #helper function for geocoding
        [address_num, address_street,
        address_suburb,
        address_postcode,
        address_city,
        address_country].compact.join(', ')
    end
    
end