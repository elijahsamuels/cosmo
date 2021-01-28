class Client < ApplicationRecord
  belongs_to :admin
  has_one :job
  
  validates :email, presence: true, uniqueness: true

end
