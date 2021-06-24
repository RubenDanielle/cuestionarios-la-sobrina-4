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
    results = {}

    #crear el hash que sirve de contador para los resultados de cada carrera
    Career.each do |career|
      results[career.id] = 0
    end

    # sumar el contador de cada carrera dependiendo de las respuestas dadas
    Question.all.each do |question| 
        choice_selected = params[:"#{question.id}"].to_i
        Outcome.all.select { |out| choice_selected == out.choice_id }.each do |outcome|
          results[outcome.career_id] += 1
        end
    end

    # guardar como resultado del cuestionario realizado por el usuario la carrera con la max punt
    resulting_career = results.key(results.values.max)
    survey = Survey.new(career_id: resulting_career, username: params['username'])

    if survey.save
      # guardar todas las respuestas dadas por el usuario
      Question.all.each do |question2|
        response = Response.new(survey_id: survey.id, question_id: question2.id, choice_id: params[:"#{question2.id}"])
        response.save
      end
      @resultadoFinal = Career[resulting_career][:name]
      erb :'surveys/result'
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

