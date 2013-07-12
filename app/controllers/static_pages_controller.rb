class StaticPagesController < ApplicationController
	def home
		if signed_in?
			redirect_to current_user.dashboard
		else
			# just render home page normally
		end
	end

	def about
		
	end

	def help
		
	end

	def contact
	end

	def test
	end
end
