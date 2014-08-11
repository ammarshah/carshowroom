class CarsController < ApplicationController
	before_filter :authenticate_user!

	def index
    @cars = Car.all
  	end
	def new
		@car=Car.new
	end
	def show
		@car = Car.find(params[:id])
	end
	
	def create
    @car = Car.new(car_params)
 
    	if @car.save
      		redirect_to @car
    	else
      		render 'new'
    	end
  	end
  	private
    def car_params
      params.require(:car).permit(:car_type, :model, :make, :version)
    end
end
