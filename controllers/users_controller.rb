class UsersController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  $users = [{
      id: 0,
      email: "user1@email.com",
      first_name: "user1",
      last_name: "user1last",
      age: 10
    },
    {
      id: 1,
      email: "user2@email.com",
      first_name: "user2",
      last_name: "user2last",
      age: 11
    },
    {
      id: 2,
      email: "user3@email.com",
      first_name: "user3",
      last_name: "user3last",
      age: 12
    }]

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  #INDEX
  get "/" do
    @title = "Users"
    @users = $users
    erb :"users/index"
  end

  #NEW
  get "/new" do
    "SHOW: THIS IS THE NEW FORM"
  end

  #SHOW
  get "/:id" do
    id = params[:id].to_i
    @users = $users[id]
    erb :"users/show"
  end

  #EDIT
  get "/:id/edit" do
    id = params[:id]
    "EDIT #{id}"
  end

  #CREATE
  post "/" do
    "CREATE NEW FORM"
  end

  #UPDATE
  patch "/:id" do
    id = params[:id]

    "UPDATE#{id}"
  end

  #DELETE
  delete "/:id" do
    id = params[:id]

    "DELETE#{id}"
  end

end
