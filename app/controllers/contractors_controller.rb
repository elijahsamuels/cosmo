class ContractorsController < ApplicationController

	before_action :require_login
	# before_action :admin_access

	def new
		@contractor = User.new
	end
		
	def index
		if params[:user_id].present?
			@contractors = User.find_by_id(current_user).contractors
			@jobs = User.find_by_id(current_user).invoices
		else
			@contractors = User.all
		end
	end
	
	def create
		@contractor = User.find_or_create_by(contractor_params)
		redirect_to contractor_path(@contractor)
	end
	
	# no show page needed, yet
	
	def edit
		find_contractor_by_id
		render "edit"
	end
	
	def update
		# datetime_for_job_start
		find_contractor_by_id
		@contractor.update(contractor_params)
		redirect_to edit_contractor_path(@contractor)
	end
	
	def destroy # we don't ever want to delete a contractor. how to hide a contractor?   
	end
	
	private
	
	def contractor_params
		params.require(:contractor).permit! #(:first_name.downcase, :last_name.downcase, :email.downcase,
	end
	
	def find_contractor_by_id
		@contractor = User.find_by(id: params[:id])
	end

end
