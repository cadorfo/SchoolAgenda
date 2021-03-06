defmodule SchoolAgenda.Router do
  use SchoolAgenda.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug SchoolAgenda.Plugs.UserSession    
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SchoolAgenda do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/teachers", TeacherController
    resources "/curriculum", SchoolCurriculumController
    resources "/disciplines", DisciplineController
  end

  scope "/auth", SchoolAgenda do
    pipe_through :browser
    get "/delete", AuthController, :delete

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", SchoolAgenda do
  #   pipe_through :api
  # end
end
