class Admin < ApplicationRecord
  has_many :users
  has_many :clients
  has_many :jobs
  
  validates :email, presence: true, uniqueness: true

end
