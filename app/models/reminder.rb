class Reminder < ActiveRecord::Base 
  belongs_to :user 
  
  validates :note, presence: true 
  validates :frequency, presence: true 
end 