require 'sinatra/base'

class SurveyController < Sinatra::Base

  configure :development, :production do
    set :views, settings.root + '/../views/surveys'
  end

  get '/surveys' do
    @careers = Career.all
    @surveys = Survey.all
    erb :'list_surveys'
  end

  get '/respond_surveys' do
    @questions = Question.all
    @choices = Choice.all
    erb :'respond_surveys'
  end
  
end