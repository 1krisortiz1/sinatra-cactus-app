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
    redirect_if_not_logged_in 
    if params[:content] != "" && params[:image] != "" && params[:location] != "" && params[:color_flowers] != "" && params[:water_conservation_method] != ""
      flash[:message] = "Success!"
      @cactus_entry = CactusEntry.create(location: params[:location], color_flowers: params[:color_flowers], water_conservation_method: params[:water_conservation_method], content: params[:content], image: params[:image], user_id: current_user.id)
      redirect "/cactus_entries/#{@cactus_entry.id}"  
    else
      flash[:error] = "Please complete all fields"
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
    redirect_if_not_logged_in
    if @cactus_entry.user == current_user
      erb :'/cactus_entries/edit'
    else
      redirect "users/#{current_user.id}"
    end
  end
  
      # find entry, modify(update) entry, redirect?
  patch '/cactus_entries/:id' do 
    set_cactus_entry
    redirect_if_not_logged_in
      if @cactus_entry.user == current_user && params[:content] != "" && params[:image] != "" && params[:location] != "" && params[:color_flowers] != "" && params[:water_conservation_method] != ""
        @cactus_entry.update(content: params[:content], image: params[:image], location: params[:location], color_flowers: params[:color_flowers], water_conservation_method: params[:water_conservation_method])
        redirect "/cactus_entries/#{@cactus_entry.id}"
      else
        redirect "users/#{current_user.id}"
      end
  end
  
  #delete
  delete '/cactus_entries/:id' do
    set_cactus_entry
    redirect_if_not_logged_in
      if @cactus_entry.user == current_user
        @cactus_entry.destroy
        redirect '/cactus_entries'
      else
        redirect '/cactus_entries'
      end
  end
  
  private
  
  def set_cactus_entry
    @cactus_entry = CactusEntry.find(params[:id])
  end
  
  def redirect_if_not_logged_in
    if !logged_in?
      redirect '/'
    end
  end

end