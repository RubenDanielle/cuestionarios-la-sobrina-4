require './models/init.rb'

class App < Sinatra::Base

  get '/' do
    erb :home
  end  


  get "/careers" do
    # en esta ruta se listan todas las carreras cargadas a la base de datos.
    @careers=Career.all
    erb :'careers/list_careers'
  end

  get "/careers/:id" do
    # Dado un id de una carrera, la obtiene de la base de datos y muestra sus datos
    @career = Career.where(id: params['id']).last
    erb :'careers/career_data'
  end

  # listado de carreras y usuarios que obtuvieron cada una
  get "/surveys" do
    @careers=Career.all
    @surveys=Survey.all
    erb :'surveys/list_surveys'
  end

  # formulario para responder un cuestionario
  get "/respond_surveys" do
    @questions = Question.all
    @choices = Choice.all
    erb :'surveys/respond_surveys' 
  end
  
  post "/surveys" do 
    results = {}

    # calcular la puntuacion del usuario en cada carrera
    results = Career.countUserPointsOnEachCareer(results, params)

    # guardar como resultado del cuestionario realizado por el usuario la carrera con la max puntuacion
    resulting_career = results.key(results.values.max)
    survey = Survey.new(career_id: resulting_career, username: params['username'])

    if survey.save

      # guardar todas las respuestas dadas por el usuario
      load_responses(params, survey.id)
      @resultadoFinal = Career[resulting_career][:name]
      # mostrar la carrera resultante
      erb :'surveys/result'

    else
      [500, {}, 'Internal Server Error']
    end  
  end

  # funcion utilizada para cargar las respuestas dadas por un usuario a las preguntas de
  # un cuestionario, se deben pasar como parametros un hash con las respuestas y el 
  # cuestionario respondido
  def load_responses(parameters, survey_id)
    Question.all.each do |question|
      response = Response.new(survey_id: survey_id, question_id: question.id, choice_id: parameters[:"#{question.id}"])
      response.save
    end
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

  get '/surveys_get_career_and_dates' do
    @surveys = Survey.all
    @careers = Career.all
    erb :'surveys/get_career_and_dates'
  end

end

