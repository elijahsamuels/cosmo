class Admin < ApplicationRecord
  has_many :users
  has_many :jobs
  has_many :clients, through: :jobs
  
  validates :email, presence: true, uniqueness: true
end
