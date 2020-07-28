defmodule DragTimeApiWeb.Router do
  use DragTimeApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*", methods: ["GET", "HEAD", "POST", "OPTIONS", "PUT", "PATCH", "DELETE"], headers: []
    plug :accepts, ["json"]
  end

  scope "/api", DragTimeApiWeb do
    pipe_through :api
    resources "/locations", LocationController, except: [:new, :edit]
    resources "/events", EventController, except: [:new, :edit]
    resources "/artists", ArtistController, except: [:new, :edit]
    resources "/access", AccessController, only: [:index, :create]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
    end
  end
end
