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
  
  # render the signup form 
  get '/signup' do
      
    erb :signup 
  end
  
  #creating a new user
  post '/users' do
    # this is where we will create a new user and persist the new user to the db 
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(params)
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else  
      erb :signup
    end
  end 
  
  # user SHOW route
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    
    erb :'/users/show'
  end 
  
  get '/logout' do 
    session.clear 
    redirect '/'
  end 
  
end