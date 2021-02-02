# class Client < ApplicationRecord
#   belongs_to :admin
#   has_many :jobs

#   accepts_nested_attributes_for :jobs, allow_destroy: true#, reject_if: proc { |att| att['name'].blank? }


  
#   # validates :email, :first_name, :last_name, :phone_number, presence: true
#   # validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
#   # validates :phone_number, length: {minimum: 10, maximum: 15 }

#   # def datetime_for_job_start
#   #   if self.job.job_start_datetime != nil
#   #     self.job.job_start_datetime.strftime("%B %d, %Y")
#   #   else
#   #     "Not Scheduled"
#   #   end
#   # end

#   # def self.search(query)
#   #   if query.present?
#   #     where('NAME like ?', "%#{query}%")
#   #   else
#   #     self.all
#   #   end
#   # end


# end
