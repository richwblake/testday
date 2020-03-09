class UsersController < ApplicationController
  
  # GET: /signup
  get "/signup" do
    erb :"/users/new.html"
  end

  get '/login' do
    erb :"/users/login.html"
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show.html'
  end

  post "/users" do
    user = User.create(params[:user])
    redirect "/users/#{user.slug}"
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
