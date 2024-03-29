defmodule RockeliveryWeb.Plugs.UUIDCheck do
  import Plug.Conn

  alias Ecto.UUID
  alias Plug.Conn

  def init(options), do: options

  def call(%Conn{params: %{"id" => id}} = connection, _options) do
    case UUID.cast(id) do
      :error -> render_error(connection)
      {:ok, __uuid} -> connection
    end
  end

  def call(connection, _options), do: connection

  defp render_error(connection) do
    body = Jason.encode!(%{message: "Invalid UUID"})

    connection
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, body)
    |> halt()
  end
end
