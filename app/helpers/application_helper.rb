module ApplicationHelper

  def logged_in?
    !!current_user # returns true if the user is logged in
  end

  def current_user # checks to see user_id is true before hitting DB.
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def call_to(phone_number)
    phone_number = number_to_phone(phone_number)
    link_to phone_number, "tel:#{phone_number}"
  end
    
  def datetime_for_job_start
    # if self.job_start_datetime != nil
    if self.job_start_datetime.present?
      self.job_start_datetime.strftime("%B %d, %Y")
    else
      "Not Scheduled"
    end
  end

end
