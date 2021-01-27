class Job < ApplicationRecord

  belongs_to :admin
  belongs_to :client
  has_many :users

end
