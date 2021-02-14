class Payment < ApplicationRecord

	belongs_to :users, optional: true
	belongs_to :jobs, optional: true
	belongs_to :business, optional: true
	accepts_nested_attributes_for :jobs

	validates :amount, presence: true

end