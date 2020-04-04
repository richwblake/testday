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

  get "/users/:slug/notecards/:id" do
    if logged_in?
      @notecard = Notecard.find(params[:id])
      erb :"/notecards/show.html"
    else
      redirect to '/login'
    end
  end

  get "/users/:slug/notecards/:id/edit" do
    @notecard = Notecard.find(params[:id])

    redirect_if_not_owner(@notecard)
    erb :"/notecards/edit.html"
  end

  post "/notecards/new" do
    notecard = Notecard.new(params[:notecard])
    if notecard.save
      current_user.notecards << notecard
      redirect to "/users/#{current_user.username}/notecards"
    else
      redirect to "/users/#{current_user.username}/notecards/new"
    end
  end

  patch "/users/:slug/notecards/:id/edit" do
    @notecard = Notecard.find(params[:id])

    redirect_if_not_owner(@notecard)
    if @notecard.update(compact_hash(params[:notecard]))
      redirect to "/users/#{current_user.username}/notecards/#{@notecard.id}"
    else
      redirect to "/users/#{current_user.username}/notecards/#{@notecard.id}/edit"
    end
  end

  delete "/users/:slug/notecards/:id/delete" do
    @notecard = Notecard.find(params[:id])
    redirect_if_not_owner(@notecard)
    @notecard.destroy
    redirect to "/users/#{current_user.username}/notecards"
  end
end
