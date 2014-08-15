class Car < ActiveRecord::Base
	belongs_to :user
	has_many :photos, :dependent => :delete_all
	validates :car_make,:car_model,:car_version,:car_year,:car_city,:car_mileage,:car_price,:car_trans,:car_desc,:car_type, presence: true

  scope :used_cars, -> { where(:car_type => "Used") }
  scope :new_cars, -> { where(:car_type => "New") }
  mount_uploader :image, ImageUploader


  	def self.search(search)  
    	if search
      		where('car_make LIKE ?', "%#{search}%")
      		# where('car_model LIKE ?', "%#{search}%")
    	else
      		@cars = Car.all
    	end
  	end
end
