defmodule WabanexWeb.IMCController do
  use WabanexWeb, :controller

  alias Wabanex.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)
  end

  def handle_response({:ok, result}, conn), do: render_response(conn, result, :ok)
  def handle_response({:error, result}, conn), do: render_response(conn, result, :bad_request)

  defp render_response(conn, result, status) do
    conn
    |> put_status(status)
    |> json(result)
  end
end
