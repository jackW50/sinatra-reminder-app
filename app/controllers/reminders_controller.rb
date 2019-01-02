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
    @reminder = Reminder.find_by(id: params[:id])
    if logged_in? && !!@reminder && reminder_permission?(@reminder)
      @frequencies = ["daily", "weekly", "monthly"]
      erb :"/reminders/edit"
    else 
      redirect "/login"
    end 
  end 
  
  patch "/reminders/:id" do
    reminder = Reminder.find_by(id: params[:id])
    if logged_in? && !!reminder && reminder_permission?(reminder)
      redirect "/reminders/#{reminder.id}"
    else 
      redirect "/login"
    end 
  end 
  
  delete "/reminders/:id/delete" do
    reminder = Reminder.find_by(id: params[:id])
    if logged_in? && !!reminder && reminder_permission?(reminder)
      reminder.destroy
      redirect "/users/#{user.id}"
    else 
      redirect "/login"
    end 
  end 
  
  get "/reminders/:id/:frequency" do
    @user = User.find_by(id: params[:id]) 
    @frequency = params[:frequency]
    if logged_in? && user_permission?(@user)
      @reminders = user.reminders.where(frequency: @frequency)
      erb :"/reminders/show_frequency"
    else 
      redirect "/login"
    end 
  end 
  
end 