class ApplicationController < ActionController::Base
  include ApplicationHelper # provides access to helper classes in ApplicationHelper

  helper_method :method_name
    #logic here
    
end
