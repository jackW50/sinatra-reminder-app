class UsersController < ApplicationController 
  
  get "/users/:id" do
    if logged_in?
      @user = current_user
      erb :"/users/show"
    else 
      "/login"
    end 
  end 
  
  get "/users/:id/edit" do 
    erb :"/users/edit"
  end 
  
  patch "/users/:id" do 
    redirect "/users/#{user.id}"
  end 
  
  delete "/users/:id/delete" do 
    session.clear
    redirect "/"
  end 
  
end 