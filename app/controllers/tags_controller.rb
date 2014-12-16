class TagsController < ApplicationController
	before_action :set_photo, only: [:create]

  def create
  	@tag = @photo.tags.create(tag_params)
  	if @tag.save
  		flash[:success] = "Photo Tagged"
  		redirect_to @photo
  	else
  		flash[:error] = "Failed To Tag"
  		redirect_to @photo
  	end
  end  

private
	def set_photo
		@photo = current_user.photos.find_by(id: params[:photo_id])
		redirect_to root_url if @photo.nil?
	end

	def tag_params
		params.require(:tag).permit(:key, :value, :photo_id)
	end
end
