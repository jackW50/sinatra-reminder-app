class User < ActiveRecord::Base 
  has_many :reminders 
end 