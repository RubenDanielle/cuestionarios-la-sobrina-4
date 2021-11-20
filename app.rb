require './models/init'
require './controllers/CareerController.rb'
require './controllers/SurveyController.rb'

class App < Sinatra::Base

  use CareerController
  use SurveyController

  get '/' do
    erb :home
  end
end
