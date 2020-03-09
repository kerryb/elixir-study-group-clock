defmodule ClockWeb.Router do
  use ClockWeb, :router

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

  scope "/", ClockWeb do
    pipe_through :browser

    resources "/", TimerController, only: [:index, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ClockWeb do
  #   pipe_through :api
  # end
end
