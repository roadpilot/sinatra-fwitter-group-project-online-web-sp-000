require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "P.=]8pTbS+76Hpw*"
    # session[:current_user] = ""
    register Sinatra::Flash
  end

  get '/' do
    if logged_in?
      erb :index
    else
      erb :'/users/login'
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

  end

end
