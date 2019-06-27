defmodule PhoenixAppWeb.UserController do
  use PhoenixAppWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
