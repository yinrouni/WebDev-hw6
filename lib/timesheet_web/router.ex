defmodule TimesheetWeb.Router do
  use TimesheetWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TimesheetWeb.Plugs.FetchCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimesheetWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/sheets",SheetController,
       only: [:new, :create, :index, :show, :update, :edit] 
    resources "/users", UserController,
       only: [:new, :create, :show, :index]
    resources "/tasks", TaskController,
	only: [:new, :create]
    resources "/sessions", SessionController, 
      only: [:new, :create, :delete], singleton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimesheetWeb do
  #   pipe_through :api
  # end
end
