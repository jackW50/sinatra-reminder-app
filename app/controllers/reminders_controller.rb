class RemindersController < ApplicationController
  
  get "/reminders" do
    erb :"/reminders/reminders"
  end 
  
  get "/reminders/new" do 
    erb :"reminders/new"
  end 
  
  post "/reminders" do 
    redirect "/reminders/#{reminder.id}"
  end 
  
  get "/reminders/:id" do 
    erb :"/reminders/show"
  end 
  
  get "/reminders/:id/edit" do 
    erb :"/reminders/edit"
  end 
  
  patch "/reminders/:id" do 
    redirect "/reminders/#{reminder.id}"
  end 
  
  delete "/reminders/:id/delete" do 
    redirect "/users/#{user.id}"
  end 
  
end 