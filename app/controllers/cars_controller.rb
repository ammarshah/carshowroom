class CarsController < ApplicationController
  before_filter :authenticate_user!, except: [:all, :used_cars, :new_cars, :index]
  before_action :set_car, only: [:show, :edit, :update, :destroy]

	# GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  def all
    if params[:q].present?
      @cars = Car.search(params[:q]).page(params[:page]).per(3).records      
    else
      @cars = Car.all.order("created_at DESC").page(params[:page]).per(3)
      @photos = Photo.all
    end
  end

  def used_cars
      @cars = Car.used_cars.order("created_at DESC").page(params[:page]).per(3)
      @photos = Photo.all
  end

  def new_cars
    @cars = Car.new_cars.order("created_at DESC").page(params[:page]).per(3)
    @photos = Photo.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @photos = @car.photos.all
  end

  # GET /cars/new
  def new
    @car = Car.new
    @photo = @car.photos.build
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        params[:photos]['image'].each do |p|
          @photo = @car.photos.create!(:image => p, :car_id => @car.id)
        end
        format.html { redirect_to @car, notice: 'Car was successfully added.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        unless params[:photos].blank?
          params[:photos]['image'].each do |p|
            @photo = @car.photos.create!(:image => p, :car_id => @car.id)
          end
        end
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:car_make, :car_model, :car_version, :car_year, :car_city, :car_mileage, :car_price, :car_trans, :car_desc, :car_type, :car_approval, :user_id, photos_attributes: [:id, :image, :car_id])
    end
end
