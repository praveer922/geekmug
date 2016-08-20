class PagesController < ApplicationController
  def home
  	@courses = Course.all.sort_by(&:average_rating).reverse
  	params[:search] = ""
  	session[:name_search] = ""
  	render layout: "nosearch"
  end

  def search

  	if params[:search].present? && params[:search].strip != ""
  		session[:name_search] = params[:search]
  	else
  		@courses_address = Course.all.sort_by(&:average_rating).reverse
  	end

  	arrResult = Array.new

  	if session[:name_search] && session[:name_search] != ""
  		@courses_address = Course.where("title LIKE ?", "%#{session[:name_search]}%")
  	else
  		@courses_address = Course.all
  	end

  	@search = @courses_address.ransack(params[:q])
  	@courses = @search.result.sort_by(&:average_rating).reverse

  	@arrCourses = @courses.to_a

  	render layout: "nosearch"

  end	
end
