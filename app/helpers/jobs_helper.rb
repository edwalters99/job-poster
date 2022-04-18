module JobsHelper
    def full_address_not_supplied
        @current_user.address_num.blank? || @current_user.address_street.blank? ||  @current_user.address_city.blank? || @current_user.address_country.blank? ||  @current_user.address_postcode.blank? 
    end 

    #provides full user address formatted correctly whether they have provided (optional) suburb or not
    def full_address user 
        if @current_user.address_suburb.blank?
            "#{ user.address_num } #{ user.address_street }, #{ user.address_city }. #{ user.address_country }. #{ user.address_postcode }"
        else
            "#{ user.address_num } #{ user.address_street }, #{ user.address_suburb }, #{ user.address_city }. #{ user.address_country }. #{ user.address_postcode }"
        end
    end

    def location_data_valid(current_user, job) 
        !current_user.distance_to(job.user).nil? && current_user.distance_to(job.user) > 0
    end
end
