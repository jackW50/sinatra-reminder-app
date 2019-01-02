class SessionsController < ApplicationController
  use Rack::Flash
  
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
    user = User.find_by(username: params[:username], email: params[:email])
    if !!user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect "/users/#{user.id}"
    else
      flash[:message] = "The username, email, and/or password is/are not valid"
      redirect "/login"
    end 
  end 
  
  post "/signup" do
    user = User.new(params)
    if user.save 
      session[:user_id] = user.id 
      redirect "/users/#{user.id}"
    else 
      flash[:message] = "You need a valid username, email, and password. Try again."
      redirect "/signup"
    end 
  end 
  
  get "/logout" do
    if !logged_in?
      redirect "/login"
    else 
      session.clear 
      redirect "/"
    end 
  end 
end 