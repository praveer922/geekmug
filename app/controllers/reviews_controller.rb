class ReviewsController < ApplicationController

	def create
		@review = current_user.reviews.create(review_params)
		redirect_to @review.course
	end

	def destroy
		@review = Review.find(params[:id])
		course = @review.course
		@review.destroy

		redirect_to course
	end

	private
		def review_params
			params.require(:review).permit(:comment, :star, :course_id)
		end
end