class UsersController < ApplicationController

  get '/users/:slug' do
    if logged_in?
      @user = User.find_by_slug(params[:slug])
      erb :'/users/show.html'
    else
      redirect to '/login'
    end
  end
  
  # GET: /signup
  get "/signup" do
    if logged_in?
      redirect to "/users/#{current_user.username}"
    else
      erb :"/users/new.html"
    end
  end

  get '/login' do
    if logged_in?
      redirect to "/users/#{current_user.username}"
    else
      erb :"/users/login.html"
    end
  end

  get '/logout' do
    if logged_in?
      session[:user_id] = nil
      redirect to '/'
    else
      redirect to '/'
    end
  end

  post "/users" do
    @user = User.new(params[:user])
    if @user.save
      redirect "/users/#{@user.slug}"
    else
      redirect to '/signup'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.username}"
    else
      redirect to '/login'
    end
  end
end
