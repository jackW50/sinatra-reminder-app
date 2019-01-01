class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :note 
      t.string :frequency 
      t.integer :user_id 
    end 
  end
end
