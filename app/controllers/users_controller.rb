class UsersController < ApplicationController 
  
  get "/users/:id" do
    user = User.find_by(id: params[:id])
    if logged_in? && user_permision?(user)
      @user = current_user
      erb :"/users/show"
    else 
      "/login"
    end 
  end 
  
  get "/users/:id/edit" do 
    user = User.find_by(id: params[:id])
    if logged_in? && user_permission?(user)
      @user = current_user
      erb :"/users/edit"
    else 
      redirect "/users/#{user.id}"
    end 
  end 
  
  patch "/users/:id" do 
    user = User.find_by(id: params[:id])
    if logged_in? && user_permission(user)
      user.update(username: params[:username], email: params[:email], password: params[:password])
      redirect "/users/#{user.id}"
    else 
      redirect "/login"
    end 
  end 
  
  delete "/users/:id/delete" do 
    session.clear 
    redirect "/"
  end 
  
end 