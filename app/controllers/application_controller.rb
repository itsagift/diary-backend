class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/users" do
    users = User.all
    # return a JSON response with an array of all the game data
    users.to_json
  end

  get "/entries" do
    entries = Entry.all
    # return a JSON response with an array of all the game data
    entries.to_json
  end

  get "/entries/:id" do
    entry = Entry.find(params[:id])
    entry.to_json
  end

  get "/:name" do 
    name = User.where(name: "#{params[:name]}").take.id
    name.to_json
  end

  get "/:name/entries" do
    entries = User.where(name: "#{params[:name]}").take.entries
    entries.to_json
  end

  post "/users" do 
    user = User.create(
      name: params[:name]
  )
    user.to_json
  end

  post "/entries" do 
    entry = Entry.create(
      body: params[:body],
      emotion: params[:emotion],
      user_id: User.where(name: "#{params[:user_id]}").take.id,
      created_at: params[:created_at],
      updated_at: params[:updated_at]
  )
    entry.to_json
  end

  patch "/entries/:id" do
    entry = Entry.find(params[:id])
    entry.update(
      body: params[:body],
      emotion: params[:emotion],
      updated_at: params[:updated_at]
    )
    entry.to_json
  end

  delete '/entries/:id' do
    # find the review using the ID
    entry = Entry.find(params[:id])
    # delete the review
    entry.destroy
    # send a response with the deleted review as JSON
    entry.to_json
  end

end
