class UsersController < ApplicationController
	def new
		if signed_in?
			flash[:error] = "Already signed in!"
			redirect_to current_user
		else
			@user = User.new
		end
	end

	def index
		@users = User.all
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Welcome!"
			redirect_to @user
			@user.create_dashboard()
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end
end
