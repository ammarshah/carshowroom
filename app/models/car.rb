class Car < ActiveRecord::Base
	belongs_to :user
	has_many :photos
	validates :car_make,:car_model,:car_version,:car_year,:car_city,:car_mileage,:car_price,:car_trans,:car_desc,:car_type, presence: true
  	mount_uploader :image, ImageUploader


  	def self.search(search)  
    	if search
      		where('car_make LIKE ?', "%#{search}%")
      		# where('car_model LIKE ?', "%#{search}%")  
    	else
      		scoped
    	end
  	end
end
