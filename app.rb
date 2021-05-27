require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    "Hello World"
  end

  get "/hello/:name" do
   @name = params[:name]
   erb :hello_template
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
    erb :'careers/list_career'
  end

  get "/careers/:id" do
    career=Career.where(id: params['id']).last
    "<h1> Resumen de la carrera #{career.name}</h1>" +
    "<ul>" +
    "<li> id: #{career.id}" +
    "<li> name: #{career.name}" +
    "<li> survey count: #{career.surveys.count}"+
    "</ul>"

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

