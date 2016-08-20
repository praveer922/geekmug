class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @courses = current_user.courses
  end

  def show
    @photos = @course.photos

    @booked = Reservation.where("course_id = ? AND user_id = ?", @course.id, current_user.id).present? if current_user

    @reviews = @course.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def new
    @course = current_user.courses.build
  end

  def create
    @course = current_user.courses.build(course_params)

    if @course.save 

      if params[:images]
        flash.now[:alert] = 'Error while sending message!'
        params[:images].each do |image|
          @course.photos.create(image: image)
        end
      end

      @photos = @course.photos
      redirect_to edit_course_path(@course), notice: "Saved..."
    else 
      flash[:alert] = "Provide all required information for this course"
      render :new
    end
  end

  def edit
    if current_user.id == @course.user.id
      @photos = @course.photos
    else 
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @course.update(course_params)

      if params[:images]
        params[:images].each do |image|
          @course.photos.create(image: image)
        end
      end

      redirect_to edit_course_path(@course), notice: "Updated..."

    else 
      flash[:alert] = "Provide all information for this course"
      render :edit
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :about, :type, :price, :location, :level, :language, :syllabus, :onlineorphysical, :freeorpaid, :link, :schedule)
    end  
      

end
