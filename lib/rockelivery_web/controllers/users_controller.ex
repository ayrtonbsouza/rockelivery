defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller

  def create(connection, params) do
    Rockelivery.create_user(params)
  end
end
