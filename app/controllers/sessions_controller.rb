class SessionsController < ApplicationController
  
  get "/login" do 
    erb :"/sessions/login"
  end 
  
  get "/signup" do 
    erb:"/sessions/signup"
  end 
  
  post "/login" do 
    redirect "/users/:id"
  end 
  
  post "/signup" do 
    redirect "/users/:id"
  end 
  
  get "/logout" do 
    redirect "/"
  end 
end 