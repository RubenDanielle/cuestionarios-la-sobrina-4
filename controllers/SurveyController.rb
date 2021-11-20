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
  
  post '/surveys' do
    results = {}
    results = Career.points_by_career(results, params)
    survey = Survey.new(career_id: results.key(results.values.max),
                        username: params['username'])
    if survey.save
      survey.load_responses(params)
      @resultadoFinal = Career[results.key(results.values.max)][:name]
      erb :'result'
    else
      [500, {}, 'Internal Server Error']
    end
  end

  get '/surveys_get_career_and_dates' do
    @surveys = Survey.all
    @careers = Career.all
    erb :'get_career_and_dates'
  end

  get '/surveys/search' do
    @career_name = Career.where(id: params['careerId'].to_i).last.name
    @first_date = DateTime.parse(params['firstDate'])
    @last_date = DateTime.parse(params['lastDate'])
    query_constraint = 'career_id = ? AND created_at > ? AND created_at < ?'
    @surveys = Survey.where(Sequel.lit(
                               query_constraint,
                               params[:careerId].to_i,
                               @first_date,
                               @last_date.next_day))
    @number_of_surveys = @surveys.all.count
    erb :'surveys_by_date_and_career'
  end
end