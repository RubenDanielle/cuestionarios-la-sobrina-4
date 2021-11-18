class SurveyController < Sinatra::Base

  configure :development, :production do
    set :views, settings.root + '/../views/surveys'
  end
  
end