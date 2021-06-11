require './models/init.rb'

class App < Sinatra::Base

  get '/' do
    erb :home
  end  


  get "/careers" do
    @careers=Career.all
    erb :'careers/list_careers'
  end

  get "/careers/:id" do
    @career = Career.where(id: params['id']).last
    erb :'careers/career_data'
  end

  post "/surveys" do 
    questions = Question.all
    careers = Career.all
    results = {}
    responses = {}
    outcomes = Outcome.all
    value = 0
    careers.map do |career|
      results[career.id] = 0
    end
    questions.map do |question| 
      choices = Choice.select {|ch| question.id == ch.question_id }.map do |choice|
        response = Response.new(survey_id: Survey.max(:id).to_i.next, question_id: question.id, choice_id: params[question.id.to_s])
        responses.merge(response)
        outcomes.select { |out| choice.id == out.choice_id }.map do |outcome|
          results[outcome.career_id] += 1
        end
      end
    end
    resulting_career = results.key(results.values.max)
    survey = Survey.new(career_id: resulting_career, username: params['username'])
    if survey.save
      responses.map do |resp|
        resp.save
      end
      [201, {'Location' => "surveys/#{survey.id}"}, 'Cuestionario guardado, su carrera resultante es ' + careers[resulting_career].name]
    else
      [500, {}, 'Internal Server Error']
    end  
  end

  get "/surveys" do
    @careers=Career.all
    @surveys=Survey.all
    erb :'surveys/list_surveys'
  end

  get "/respond_surveys" do
    @questions = Question.all
    @choices = Choice.all
    erb :'surveys/respond_surveys' 
  end

  post "/posts" do
    request.body.rewind  # in case someone already read it
    data = JSON.parse request.body.read
    post = Post.new(description: data['desc'])
    if post.save
      [201, { 'Location' => "posts/#{post.id}" }, 'CREATED']
    else
      [500, {}, 'Internal Server Error']
    end
  end

  get '/posts' do
    p = Post.where(id: 1).last
    p.description
  end
end

