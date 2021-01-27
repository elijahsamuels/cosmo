class User < ApplicationRecord

  belongs_to :admin
  has_many :jobs
  
  validates :email, presence: true, uniqueness: true
  # validates :email, presence: true, on: :update # a way to validate the email on ONLY the update 

end
