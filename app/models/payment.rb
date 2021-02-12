class Payment < ApplicationRecord

	belongs_to :users, optional: true
	belongs_to :jobs, optional: true
	belongs_to :business, optional: true
	accepts_nested_attributes_for :jobs


end

# user has many payments
# job has many payemnts 

# payment belongs_to users
# payment belongs_to jobs