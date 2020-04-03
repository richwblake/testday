require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    if logged_in?
      redirect to "/users/#{current_user.username}"
    else
      erb :homepage
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      session[:user_id] ? @current_user = User.find(session[:user_id]) : @current_user = nil
    end

    def compact_hash(user_hash)
      user_hash.delete_if { |k, v| v.empty? }
    end
  end
end
