defmodule RockeliveryWeb.Router do
  use RockeliveryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", RockeliveryWeb do
    pipe_through :api

    resources "/users", UsersController, except: [:new, :edit]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: RockeliveryWeb.Telemetry
    end
  end
end
