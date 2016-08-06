defmodule Vacuum.Router do
  use Vacuum.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", Vacuum do
  #   pipe_through :browser # Use the default browser stack
  #   get "/", PageController, :index
  # end

  scope "/", Vacuum do
    pipe_through :api
    post "/github", GithubController, :create
  end

end
