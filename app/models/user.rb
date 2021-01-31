class User < ApplicationRecord

  belongs_to :admin
  has_many :jobs
  
  # validates :email, :first_name, :last_name, :phone_number, presence: true
  # validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :phone_number, length: {minimum: 10, maximum: 15 }


end
