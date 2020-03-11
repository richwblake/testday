class NotecardsController < ApplicationController

  # GET: /notecards
  get "/users/:slug/notecards" do
    if logged_in?
      @user = current_user
      erb :"/notecards/index.html"
    else
      redirect to '/login'
    end
  end

  get "/users/:slug/notecards/new" do
    if logged_in?
      erb :"/notecards/new.html"
    else
      redirect to '/login'
    end
  end

  post "/notecards/new" do
    notecard = Notecard.new(params[:notecard])
    if notecard.save
      current_user.notecards << notecard
      redirect to '/users/:slug/notecards'
    else
      redirect to 'users/:slug/notecards/new'
    end
  end
end
