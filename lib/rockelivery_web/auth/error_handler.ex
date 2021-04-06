defmodule RockeliveryWeb.Auth.ErrorHandler do
  @behaviour Guardian.Plug.ErrorHandler

  alias Plug.Conn

  def auth_error(conn, {error, _reason}, _opts) do
    body = Jason.encode!(%{message: to_string(error)})

    Conn.send_resp(conn, 401, body)
  end
end
