require './models/init.rb'

class App < Sinatra::Base

  get '/' do
    erb :home
  end  

  post "/careers" do
 
    career = Career.new(name: params['name'])

    if career.save
      [201, {'Location' => "careers/#{career.id}"}, 'Carrera agregada']
    else
      [500, {}, 'Internal Server Error']
    end
  end 

  get "/careers" do
    @careers=Career.all
    erb :'careers/list_careers'
  end

  get "/careers/:id" do
    @career = Career.where(id: params['id']).last
    erb :'careers/career_data'
  end

  post "/questions" do
    question = Question.new(name: params['name'], description: params['description'], number: params['number'], type: params['type'])
    if question.save
      choice1 = Choice.new(question_id: question.id, text: params['text1'])
      choice2 = Choice.new(question_id: question.id, text: params['text2'])
      if params['text3'] && !(params['text3'].empty?)
        choice3 = Choice.new(question_id: question.id, text: params['text3'])
        choice3.save
      end
      if params['text4'] && !(params['text4'].empty?)
        choice4 = Choice.new(question_id: question.id, text: params['text4'])
        choice4.save
      end
      if params['text5'] && !(params['text5'].empty?)
        choice5 = Choice.new(question_id: question.id, text: params['text5'])
        choice5.save
      end
      if choice1.save && (choice2.save || choice3 || choice4 || choice5)
        [201, {'Location' => "questions/#{question.id}"}, 'Pregunta agregada']
      else
        [500, {}, 'Internal Server Error']
      end
    else
      [500, {}, 'Internal Server Error']
    end
  end

  get "/questions" do
    erb :'questions/create_question'
  end

  # esta ruta es para probar si se crean las respuestas, luego se debe borrar
  get "/questions_list" do
    @questions = Question.all
    erb :'questions/list_questions'
  end

  get "/questions/:id" do
    @question = Question.where(id: params['id']).last
    erb :'questions/questions_data'
  end

  get "/choices" do
    erb :'choices/create_choice'
  end

  get "/surveys" do
    @careers=Career.all
    @surveys=Survey.all
    erb :'surveys/list_surveys'
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

