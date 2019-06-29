defmodule PhoenixApp.Auth.Guardian do
  @moduledoc false

  use Guardian, otp_app: :phoenix_app

  alias PhoenixApp.User
  alias PhoenixApp.Repo

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    user = Repo.get(User, id)
    {:ok, user}
  end
end
