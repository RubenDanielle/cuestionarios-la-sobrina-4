class CareerController < Sinatra::Base

  configure :development, :production do
    set :views, settings.root + '/../views/careers'
  end

end