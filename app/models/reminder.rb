class Reminder < ActiveRecord::Base 
  belongs_to :user 
  
  validates :note, :frequency, presence: true 
end 