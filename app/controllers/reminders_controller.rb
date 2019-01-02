class RemindersController < ApplicationController
  
  get "/reminders" do
    if logged_in?
      @user = current_user
      @reminders = @user.reminders 
      erb :"/reminders/reminders"
    else 
      redirect "/login"
    end 
  end 
  
  get "/reminders/new" do
    if logged_in?
      erb :"reminders/new"
    else 
      redirect "/login"
    end 
  end 
  
  post "/reminders" do 
    if logged_in?
      reminder = Reminder.new(params)
      if reminder.save
        reminder.user = current_user
        redirect "/reminders/#{reminder.id}"
      else 
        redirect "/reminders/new"
      end 
    else 
      redirect "/login"
    end 
  end 
  
  get "/reminders/:id" do
    @reminder = Reminder.find_by(id: params[:id])
    if logged_in? && !!@reminder && reminder_permission?(@reminder)
      erb :"/reminders/show"
    else 
      redirect "/login"
    end 
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
  
  get "/reminders/:id/:frequency" do
    user = User.find_by(id: params[:id])
    if logged_in? && user_permission?(user)
      @reminders = user.reminders.where(frequency: params[:frequency])
      erb :"/reminders/show_frequency"
    else 
      redirect "/users/#{current_user.id}"
    end 
  end 
  
end 