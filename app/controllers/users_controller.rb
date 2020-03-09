class UsersController < ApplicationController
  
  # GET: /signup
  get "/signup" do
    erb :"/users/new.html"
  end

  get '/login' do
    erb :"/users/login.html"
  end

  # POST: /users
  post "/users" do
    user = User.create(params[:user])
    redirect "/users/#{user.slug}"
  end

  post '/login' do
    
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show.html'
  end
end
