defmodule RockeliveryWeb.WelcomeController do
  use RockeliveryWeb, :controller

  def index(connection, params) do
    connection
    |> put_status(:ok)
    |> json(params)
  end
end
