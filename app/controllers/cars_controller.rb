class CarsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@car=Car.new
	end
	def show_used

	end
	def show_new

	end
end
