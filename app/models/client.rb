class Client < ApplicationRecord
  belongs_to :admin
  has_many :jobs
  
  validates :email, presence: true, uniqueness: true

  # def datetime_for_job_start
  #   if self.job.job_start_datetime != nil
  #     self.job.job_start_datetime.strftime("%B %d, %Y")
  #   else
  #     "Not Scheduled"
  #   end
  # end

  # def self.search(query)
  #   if query.present?
  #     where('NAME like ?', "%#{query}%")
  #   else
  #     self.all
  #   end
  # end


end
