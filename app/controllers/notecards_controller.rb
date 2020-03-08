class NotecardsController < ApplicationController

  # GET: /notecards
  get "/notecards" do
    erb :"/notecards/index.html"
  end

  # GET: /notecards/new
  get "/notecards/new" do
    erb :"/notecards/new.html"
  end

  # POST: /notecards
  post "/notecards" do
    redirect "/notecards"
  end

  # GET: /notecards/5
  get "/notecards/:id" do
    erb :"/notecards/show.html"
  end

  # GET: /notecards/5/edit
  get "/notecards/:id/edit" do
    erb :"/notecards/edit.html"
  end

  # PATCH: /notecards/5
  patch "/notecards/:id" do
    redirect "/notecards/:id"
  end

  # DELETE: /notecards/5/delete
  delete "/notecards/:id/delete" do
    redirect "/notecards"
  end
end
