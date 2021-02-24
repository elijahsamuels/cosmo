module ApplicationHelper

  def total_paid
    tp = @job.payments.where(job_id: @job.id)
    @total_paid = tp.map.each { |a| a.amount }.sum
  end

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
  
  def current_admin 
    params[:id].to_i == current_user.id
  end
  
  def not_found
    flash[:error] = "Let's calm down" 
    redirect_to root_path
  end
  

  # def current_client 
  #   if current_user.client && !current_user.admin && !current_user.contractor
      
  # end

  #   params[:id].to_i == current_user.id

  #   if params.has_value?("jobs")
  #   end

  


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

  def admin_stats_financials
  @total_financials_of_jobs = number_to_currency(Job.where(admin_id: current_user.id).map.each{|t| t.total_amount}.sum)
  @total_financials_of_inquiries = number_to_currency(Job.where(status: "Inquiry").and(Job.where(admin_id: current_user.id)).map.each{|t| t.total_amount}.sum)
  @total_financials_of_tentative = number_to_currency(Job.where(status: "Tentative").and(Job.where(admin_id: current_user.id)).map.each{|t| t.total_amount}.sum)
  @total_financials_of_completed = number_to_currency(Job.where(status: "Completed").and(Job.where(admin_id: current_user.id)).map.each{|t| t.total_amount}.sum)
  @total_financials_of_confirmed = number_to_currency(Job.where(status: "Confirmed").and(Job.where(admin_id: current_user.id)).map.each{|t| t.total_amount}.sum)
  @total_financials_of_postponed = number_to_currency(Job.where(status: "Postponed").and(Job.where(admin_id: current_user.id)).map.each{|t| t.total_amount}.sum)
  @total_financials_of_cancelled = number_to_currency(Job.where(status: "Cancelled").and(Job.where(admin_id: current_user.id)).map.each{|t| t.total_amount}.sum*-1)

  end

end
