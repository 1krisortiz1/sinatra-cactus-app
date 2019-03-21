class CactusEntriesController < ApplicationController
  
  #create
  get '/cactus_entries/new' do
    erb :'/cactus_entries/new'
  end 
  
  post '/cactus_entries' do
    # create a new entry and save it to the database 
    # only create if the user is logged in
    if !logged_in?
      redirect '/'
    end 
    # only save the entry if it has some content
    if params[:content] != ""
      @cactus_entry = CactusEntry.create(content: params[:content], user_id: current_user.id)
      redirect "/cactus_entries/#{@cactus_entry.id}"  
    else
      redirect '/cactus_entries/new'
    end
  end
  
  #read Show route 
  get '/cactus_entries/:id' do 
    @cactus_entry = CactusEntry.find([:id])
    erb :'/cactus_entries/show'
  end
  
  #update
  
  #delete
  
  
end