class ApplicationController < ActionController::Base
  include ApplicationHelper # provides access to helper classes in ApplicationHelper  


  def not_found
    flash[:error] = "Let's calm down" 
    redirect_to root_path
  end

end

