class Business < ApplicationRecord

    has_many :users
    has_many :jobs
    has_many :payments
    
  #   # validates :email, :first_name, :last_name, :phone_number, presence: true
  #   # validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  #   # validates :phone_number, length: {minimum: 10, maximum: 15 }
  
end

