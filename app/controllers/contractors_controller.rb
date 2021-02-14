class ContractorsController < ApplicationController

	before_action :require_login
	before_action :admin_access

	def new
		@contractor = User.new
	end
		
	def index
		if params[:user_id].present?
			@contractors = User.find_by_id(current_user).contractors
			@jobs = User.find_by_id(current_user).invoices
		elsif !params[:user_id].present?
			@contractors = User.all
		end
	end
	
	
	def create
		@contractor = User.find_or_create_by(contractor_params)
		redirect_to contractor_path(@contractor)
	end
	
	# @user = User.new(user_params)
	# if @user.save
	#   session[:user_id] = @user.id
	#   redirect_to user_path(@user)
	# else
	#   @error = @user.errors.full_messages
	#   render :signup
	# end 
	
	
	# no show page needed
	
	def edit
		@contractor = User.find(params[:id])
		render "edit"
	end
	
	def update
		# datetime_for_job_start
		@contractor = User.find(params[:id])
		@contractor.update(contractor_params)
		redirect_to edit_contractor_path(@contractor)
	end
	
	def destroy # we don't ever want to delete a contractor. how to hide a contractor?   
	end
	
	private
	
	
	def contractor_params
		params.require(:contractor).permit! #(:first_name.downcase, :last_name.downcase, :email.downcase,
	end
	
end
