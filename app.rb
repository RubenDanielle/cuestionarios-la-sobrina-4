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



  get "/surveys" do
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

