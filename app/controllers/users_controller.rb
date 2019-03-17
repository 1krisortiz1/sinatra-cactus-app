class UsersController < ApplicationController 
  
  
  #renders login page 
  get '/login' do
    erb :login
  end
  
  
  get '/signup' do
    
  end
  
end