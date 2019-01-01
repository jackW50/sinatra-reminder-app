class UsersController < ApplicationController 
  
  get "/users/:id" do 
    erb :"/users/show"
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