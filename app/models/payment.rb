class Payment < ApplicationRecord

	belongs_to :users
	belongs_to :jobs
	# belongs_to :businesses
	accepts_nested_attributes_for :jobs

end
