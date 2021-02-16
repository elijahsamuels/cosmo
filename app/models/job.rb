class Job < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :business, optional: true

  has_many :invoices
  has_many :users, through: :invoices
  has_many :payments
  
  validates :status, :datetime_for_job_start, :address_1, :city, :state, :zip, presence: true
  # has_many :users
  # has_many :invoices, through: :users

  # NEED TO MOVE THIS
  def datetime_for_job_start
    if self.job_start_datetime.present?
      self.job_start_datetime.strftime("%B %d, %Y")
    else
      "Not Scheduled"
    end
  end

  def user_attributes=(params)
    user = User.find_by_id(params[:user_id])
    if user.admin?
      client = User.create(first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          phone: params[:phone],
          address_1: params[:address_1],
          address_2: params[:address_2],
          city: params[:city],
          state: params[:state],
          zip: params[:zip],
          client: true,
          password: SecureRandom.hex(10))
      self.users << client
    else
      self.users << user
    end
  end
  
end
