class Course < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :reviews

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  validates :title, presence: true, length: {maximum:50}
  validates :about, presence: true, length: {maximum:500}
  validates :freeorpaid, presence: true
  validates :onlineorphysical, presence: true

  def average_rating 
  	reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

end
