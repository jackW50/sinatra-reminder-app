class SessionsController < ApplicationController
  
  get "/login" do 
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
      erb :"/sessions/login"
    end 
  end 
  
  get "/signup" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
      erb:"/sessions/signup"
    end 
  end 
  
  post "/login" do
    user = User.find_by(username: params[:username], email: params[:username])
    if !!user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect "/users/#{user.id}"
    else
      redirect "/login"
    end 
  end 
  
  post "/signup" do
    user = User.new(params)
    if user.save 
      session[:user_id] = user.id 
      redirect "/users/#{user.id}"
    else 
      redirect "/signup"
    end 
  end 
  
  get "/logout" do
    session.clear 
    redirect "/"
  end 
end 