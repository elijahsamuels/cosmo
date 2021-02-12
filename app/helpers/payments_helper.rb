module PaymentsHelper

	def negate_amount
		-refund_amount.amount
	end

end
