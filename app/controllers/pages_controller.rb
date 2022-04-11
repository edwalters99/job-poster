class PagesController < ApplicationController
    before_action :check_for_login  #only allow access if logged in
    
    def home
    end

end
