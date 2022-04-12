class ApplicationController < ActionController::Base
    before_action :fetch_user  # executes every time someone loads a page
    
    private
    def fetch_user
        @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
        session[:user_id] = nil unless @current_user.present? #log out non existent users
    end

    def check_for_login #security - prevents access to site functionality when not logged in
        redirect_to login_path unless @current_user.present?
    end

    def check_for_owner (obj) #prevents non owners of jobs or comments deleting or editing them
        redirect_to root_path unless obj.user_id == @current_user.id
    end

end
