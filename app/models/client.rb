class Client < ApplicationRecord
  belongs_to :admin
  
  validates :email, presence: true, uniqueness: true

end
