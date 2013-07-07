class UsersController < ApplicationController
	def new
		@user = User.new
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
