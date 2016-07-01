class Review < ActiveRecord::Base

  include ActiveModel::ForbiddenAttributesProtection
  
  belongs_to :user
  belongs_to :movie
  attr_accessible :rating_out_of_ten, :text
  
  validates :user, presence: true
  validates :user, presence: true
  validates :text, presence: true
  validates :rating_out_of_ten, numericality: { only_integer: true,
								greater_than_or_equal_to: 1,
								less_than_or_equal_to: 10 }
  
end
