class Job < ApplicationRecord
  belongs_to :admin
  belongs_to :client
  has_many :users

  def datetime_for_job_start
    if self.job_start_datetime != nil
      self.job_start_datetime.strftime("%B %d, %Y")
    else
      "Not Scheduled"
    end
  end


end
