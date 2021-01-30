module ApplicationHelper

    def logged_in?
      !!current_user # returns true if the user is logged in
    end

    def current_user # checks to see user_id is true before hitting DB.
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    

end
