class PhotosController < ApplicationController

	def destroy
		@photo = Photo.find(params[:id])
		course = @photo.course

		@photo.destroy
		@photos = Photo.where(course_id: course.id)

		respond_to :js
	end

end