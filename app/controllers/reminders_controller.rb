class RemindersController < ApplicationController
  
  get "/reminders" do
    if logged_in?
      @user = current_user
      @reminders = @user.reminders 
      erb :"/reminders/reminders"
    else 
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  get "/reminders/new" do
    if logged_in?
      erb :"reminders/new"
    else
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  post "/reminders" do
    if logged_in?
      reminder = Reminder.new(params)
      reminder.user = current_user 
      if reminder.save
        redirect "/reminders/#{reminder.id}"
      else 
        flash[:message] = "In order to create a reminder you must have text and select whether it's daily, weekly, or monthly."
        redirect "/reminders/new"
      end 
    else
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  get "/reminders/:id" do
    @reminder = Reminder.find_by(id: params[:id])
    if logged_in? && !!@reminder
      if reminder_permission?(@reminder)
        erb :"/reminders/show"
      else 
        flash[:message] = "You don't have permission to do that."
        redirect "/users/#{current_user.id}"
      end 
    else 
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  get "/reminders/:id/edit" do
    @reminder = Reminder.find_by(id: params[:id])
    if logged_in? && !!@reminder 
      if reminder_permission?(@reminder)
        @frequencies = ["daily", "weekly", "monthly"]
        erb :"/reminders/edit"
      else 
        flash[:message] = "You don't have permission to do that."
        redirect "/users/#{current_user.id}"
      end 
    else 
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  patch "/reminders/:id" do
    reminder = Reminder.find_by(id: params[:id])
    if logged_in? && !!reminder 
      if reminder_permission?(reminder)
        reminder.update(note: params[:note], frequency: params[:frequency])
        redirect "/reminders/#{reminder.id}"
      else 
        flash[:message] = "You don't have permission to do that."
        redirect "/users/#{current_user.id}"
      end 
    else
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  delete "/reminders/:id/delete" do
    reminder = Reminder.find_by(id: params[:id])
    if logged_in? && !!reminder 
      if reminder_permission?(reminder)
        reminder.destroy
        redirect "/users/#{current_user.id}"
      else 
        flash[:message] = "You don't have permission to do that."
        redirect "/users/#{current_user.id}"
      end 
    else 
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  get "/reminders/:id/:frequency" do
    @user = User.find_by(id: params[:id]) 
    @frequency = params[:frequency]
    if logged_in?
      if user_permission?(@user)
        @reminders = @user.reminders.where(frequency: @frequency)
        erb :"/reminders/show_frequency"
      else 
        flash[:message] = "You don't have permission to do that."
        redirect "/users/#{current_user.id}"
      end 
    else 
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
end 