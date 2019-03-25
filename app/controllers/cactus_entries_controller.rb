class CactusEntriesController < ApplicationController
  
  get '/cactus_entries' do
    @cactus_entries = CactusEntry.all 
    
    erb :'cactus_entries/index'
  end
  
  #create
  get '/cactus_entries/new' do
    erb :'/cactus_entries/new'
  end 
  
  post '/cactus_entries' do
    if !logged_in?
      redirect '/'
    end 
    
    if params[:content] != ""
      @cactus_entry = CactusEntry.create(content: params[:content], image: params[:image], user_id: current_user.id)
      redirect "/cactus_entries/#{@cactus_entry.id}"  
    else
      redirect '/cactus_entries/new'
    end
  end
  
  #read Show route 
  get '/cactus_entries/:id' do 
    set_cactus_entry
    erb :'/cactus_entries/show'
  end
  
  #update
  get '/cactus_entries/:id/edit' do
    set_cactus_entry
    if logged_in?
      if @cactus_entry.user == current_user
        erb :'/cactus_entries/edit'
      else
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end
  
      # find entry, modify(update) entry, redirect?
  patch '/cactus_entries/:id' do 
    set_cactus_entry
    if logged_in?
      if @cactus_entry.user == current_user && params[:content] != "" && params[:image]
        @cactus_entry.update(content: params[:content], image: params[:image])
        redirect "/cactus_entries/#{@cactus_entry.id}"
      else
        redirect "users/#{current_user.id}"
      end
    else 
      redirect '/'
    end
  end
  
  #delete
  delete '/cactus_entries/:id' do
    set_cactus_entry
    if logged_in?
      if @cactus_entry.user == current_user
        @cactus_entry.destroy
        redirect '/cactus_entries'
      else
        redirect '/cactus_entries'
      end
    end
  end
  
  private
  
  def set_cactus_entry
    @cactus_entry = CactusEntry.find(params[:id])
  end
  
end