require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_secret"
  end

  get "/" do
    if logged_in? 
      redirect "/users/#{current_user.id}"
    else 
      erb :welcome
    end 
  end
  
  helpers do 
    
    def logged_in?
      !!session[:user_id]
    end 
    
    def current_user 
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 
    
    def user_permission?(user)
      user.id == current_user.id 
    end 
  end 

end
