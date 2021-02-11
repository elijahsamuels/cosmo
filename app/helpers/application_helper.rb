module ApplicationHelper


  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in for that section."
      redirect_to root_path # halts request cycle
    end
  end

  def logged_in?
    !!current_user # returns true if the user is logged in
  end
      
  def current_user # checks to see user_id is true before hitting DB.
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def admin_access
    unless current_user.admin?
      flash[:error] = "You don't have permissions for that section."
      redirect_to root_path # halts request cycle
    end
  end

    #QUESTION: this isn't working. the logic works but only directly in the view. not being called right?
  def current_admin 
    if params[:id].to_i == current_user.id
      # flash[:error] = "You don't have permissions for that section."
      # redirect_to root_path # halts request cycle
    end
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

  def admin_stats
    @total_number_of_jobs = Job.where(admin_id: current_user.id).count
    @total_number_of_inquiries = Job.where(status: "Inquiry").and(Job.where(admin_id: current_user.id)).count
    @total_number_of_tentative = Job.where(status: "Tentative").and(Job.where(admin_id: current_user.id)).count
    @total_number_of_completed = Job.where(status: "Completed").and(Job.where(admin_id: current_user.id)).count
    @total_number_of_confirmed = Job.where(status: "Confirmed").and(Job.where(admin_id: current_user.id)).count
    @total_number_of_postponed = Job.where(status: "Postponed").and(Job.where(admin_id: current_user.id)).count
    @total_number_of_cancelled = Job.where(status: "Cancelled").and(Job.where(admin_id: current_user.id)).count
  end

end
