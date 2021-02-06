class Job < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :business, optional: true

  has_many :job_users
  has_many :users, through: :job_users

  # has_many :users
  # has_many :job_users, through: :users

  # NEED TO MOVE THIS
  def datetime_for_job_start
    if self.job_start_datetime.present?
      self.job_start_datetime.strftime("%B %d, %Y")
    else
      "Not Scheduled"
    end
  end

end


