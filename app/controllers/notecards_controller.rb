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
end
