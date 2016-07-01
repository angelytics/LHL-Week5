class Movie < ActiveRecord::Base
  
  include ActiveModel::ForbiddenAttributesProtection
  
  has_many :reviews
  attr_accessible :description, :director, :poster_image_url, :release_date, :runtime_in_minutes, :title
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :poster_image_url, presence: true
  validate :release_date, presence: true
  validate :release_date_is_in_the_past
  
  def review_average
    if reviews.size != 0
    reviews.sum(:rating_out_of_ten)/reviews.size
    else
	  errors.add("No reviews are available for this film")
	end
  end

  protected
  
  def release_date_is_in_the_past
    if release_date.present?
	  errors.add(:release_date, "should be in the past") if release_date > 2016
	end
  end
  
end
