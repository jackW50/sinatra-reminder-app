class User < ActiveRecord::Base 
  has_many :reminders 
  
  has_secure_password 
  
  validates :username, :email, presence: true 
  validates_uniqueness_of :email, :username
end 