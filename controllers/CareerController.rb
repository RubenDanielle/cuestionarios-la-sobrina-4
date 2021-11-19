require 'sinatra/base'

class CareerController < Sinatra::Base

  configure :development, :production do
    set :views, settings.root + '/../views/careers'
  end


  get '/careers' do
    @careers = Career.all
    erb :'list_careers'
  end


  get '/careers/:id' do
    @career = Career.where(id: params['id']).last
    erb :'career_data'
  end


end