class PhotosController < ApplicationController
	before_action :set_photo, only: [:show, :edit, :update, :destroy]

	def destroy
		@photo.destroy
		respond_to do |format|
      	  format.html { redirect_to :back, notice: 'Photo was successfully removed.' }
      	  format.json { head :no_content }
    end
	end


private
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:id, :image, :car_id)
    end
end
