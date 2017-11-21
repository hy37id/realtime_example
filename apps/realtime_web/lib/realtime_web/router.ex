defmodule RealtimeWeb.Router do
  @moduledoc "The `Phoenix.Router` for `RealtimeWeb`"

  use RealtimeWeb, :router

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

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug, schema: RealtimeAPI.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: RealtimeAPI.Schema,
      socket: RealtimeWeb.UserSocket
  end

  scope "/", RealtimeWeb do
    # Use the default browser stack
    pipe_through :browser

    get "/", PageController, :index
  end
end
