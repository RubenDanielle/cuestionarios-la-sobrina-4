require './models/init'
require './controllers/CareerController.rb'
require './controllers/SurveyController.rb'

class App < Sinatra::Base

  use CareerController
  use SurveyController

  post '/surveys' do
    results = {}
    results = Career.points_by_career(results, params)
    survey = Survey.new(career_id: results.key(results.values.max),
                        username: params['username'])
    if survey.save
      load_responses(params, survey.id)
      @resultadoFinal = Career[results.key(results.values.max)][:name]
      erb :'surveys/result'
    else
      [500, {}, 'Internal Server Error']
    end
  end

  def load_responses(parameters, survey_id)
    Question.all.each do |question|
      response = Response.new(survey_id: survey_id, question_id: question.id,
                              choice_id: parameters[:"#{question.id}"])
      response.save
    end
  end

  get '/surveys_get_career_and_dates' do
    @surveys = Survey.all
    @careers = Career.all
    erb :'surveys/get_career_and_dates'
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
    erb :'surveys/surveys_by_date_and_career'
  end

  get '/' do
    erb :home
  end

end
