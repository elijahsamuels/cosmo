class Client < ApplicationRecord
  belongs_to :admin
  has_many :jobs
  
  validates :email, presence: true, uniqueness: true

end
