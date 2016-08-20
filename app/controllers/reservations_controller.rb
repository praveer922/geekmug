class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def create
		course = Course.find(params[:course_id])
		if(current_user==course.user)
			redirect_to course, notice: "You have already enrolled in this course!"
		else
			@reservation = current_user.reservations.create(reservation_params)

			redirect_to @reservation.course, notice: "You have enrolled successfully."
		end
	end

	def your_enrolled_courses
		@enrolled_courses = current_user.reservations
	end

	def your_students
		@courses = current_user.courses
	end

	private 
		def reservation_params
			params.require(:reservation).permit(:start_date, :price, :course_id)
		end

end