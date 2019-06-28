defmodule PhoenixAppWeb.SessionController do
  use PhoenixAppWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case PhoenixApp.Auth.authenticate_user(email, password) do
      {:ok, user} ->
        conn
        |> PhoenixApp.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username or password.")
        |> render("new.html")
    end
  end

  def delete(conn, %{id: id}) do
    IO.inspect(conn)
  end
end
