module JobsHelper
    def full_address_not_supplied
        @current_user.address_num.blank? || @current_user.address_street.blank? ||  @current_user.address_suburb.blank? || @current_user.address_city.blank? || @current_user.address_country.blank? ||  @current_user.address_postcode.blank? 
    end

    def full_address user
        "#{ user.address_num } #{ user.address_street }, #{ user.address_suburb }, #{ user.address_city }. #{ user.address_country }. #{ user.address_postcode }"
    end
end
