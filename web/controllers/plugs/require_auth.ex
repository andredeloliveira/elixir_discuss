defmodule Discuss.Plug.RequireAuth do
  
  import Plug.Conn
  import Plug.Controller

  alias Discuss.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      |> put_flash(:error, "You mus be logged in")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt()
    end
  end

end