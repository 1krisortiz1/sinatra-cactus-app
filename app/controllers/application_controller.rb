require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "super_secret"
  end

  get "/" do
    erb :welcome
  end
  
  helpers do
    
    def logged_in?
      #true if user is logged in, otherwise false 
      !!current_user
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) # eliminates database calls.  
      # reduces the number of database calls
      # an instance variable life outside of its own method.  
      # the first time current_user is referenced within a scope of the instance of ApplicationController this instance variable will be created and assigned if the user is found otherwise it will still be nil. a subsequent call to current_user if already populated won't hit the database again. 
    end 
    
  end 

end
