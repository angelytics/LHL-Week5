class User < ActiveRecord::Base

  include ActiveModel::ForbiddenAttributesProtection
  
  has_secure_password
  has_many :reviews
  attr_accessible :email, :firstname, :lastname, :password_digest
  attr_accessible :password, :password_confirmation
  
  def full_name
    "#{firstname} #{lastname}"
  end
  
end
