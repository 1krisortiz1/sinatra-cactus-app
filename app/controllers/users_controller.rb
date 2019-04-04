class UsersController < ApplicationController 
  
  get '/login' do #renders login page 
    erb :login
  end
  
  post '/login' do
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        puts session
        flash[:message] = "Welcome, #{@user.name}!" 
        redirect to "users/#{@user.id}"
      else
        flash[:error] = "Email or Password incorrect. Please sign up or try again."
        erb :login 
    end
  end
  
  get '/signup' do
    erb :signup 
  end
  
  post '/users' do
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(params)
      session[:user_id] = @user.id 
      flash[:message] = "You've successfully created an account, #{@user.name}! Welcome!"
      redirect "/users/#{@user.id}"
    else  
      flash[:error] = "Must enter a Name, Email, and Password. Please try again."
      erb :signup
    end
  end 
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end 
  
  get '/logout' do 
    session.clear 
    redirect '/'
  end 
  
end