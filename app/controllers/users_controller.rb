class UsersController < ApplicationController 
  
  
  #renders login page 
  get '/login' do
    erb :login
  end
  
  #creates a session. Adding a key value paid to the session hash 
  #receive the login form, find the user, and log the user in (create a session).
  post '/login' do
    # find the user
      @user = User.find_by(email: params[:email])
    # authenticate the user 
      if @user.authenticate(params[:password]) # this code should be in an if statement
      # test tux, User.find_by(email: "grant@grant.com")
      # assign variable, grant = _ 
      # grant, shows user params 
      # grant.authenticate("goldfish") #=> false 
      # grant.authenticate("password") #=> returns user info
    #create session
        session[:user_id] = @user.id # actually logging the user in. 
        puts session
        redirect to "users/#{@user.id}"
      else
        #tell the user they entered invalid credentials
        # redirect to the user's landing page
    # Log the user in 
    # redirect to the user's landing page 
  end
  end
  
  
  get '/signup' do
    
  end
  
  get '/users/:id' do
    "user show route"
  end 
  
end