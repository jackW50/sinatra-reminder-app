class UsersController < ApplicationController 
  
  get "/users/:id" do
    user = User.find_by(id: params[:id])
    if logged_in?
      if user_permission?(user) 
        @user = current_user
        erb :"/users/show"
      else 
        flash[:message] = "You don't have permission to do that."
        redirect "/users/#{current_user.id}"
      end 
    else
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  get "/users/:id/edit" do
    user = User.find_by(id: params[:id])
    if logged_in?
      if user_permission?(user) 
        @user = current_user
        erb :"/users/edit"
      else 
        flash[:message] = "You don't have permission to do that."
        redirect "/users/#{current_user.id}"
      end 
    else 
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  patch "/users/:id" do 
    user = User.find_by(id: params[:id])
    if logged_in? 
      if user_permission?(user)
        if user.update(username: params[:username], email:   params[:email], password: params[:password])
          redirect "/users/#{user.id}"
        else 
          flash[:message] = "You must have all fields filled in and username and email have to be unique."
          redirect "/users/#{current_user.id}/edit"
        end 
      else 
        flash[:message] = "You don't have permission to do that."
        redirect "/users/#{current_user.id}"
      end 
    else 
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
  delete "/users/:id/delete" do
    user = User.find_by(id: params[:id])
    if logged_in? 
      if user_permission?(user)
        if !user.reminders.empty? 
          user.reminders.each do |reminder|
            reminder.destroy
          end 
        end 
      else 
        flash[:message] = "You don't have permission to do that."
        redirect "/users/#{current_user.id}"
      end 
      user.destroy
      session.clear 
      redirect "/"
    else 
      flash[:message] = "You are not logged in."
      redirect "/login"
    end 
  end 
  
end 