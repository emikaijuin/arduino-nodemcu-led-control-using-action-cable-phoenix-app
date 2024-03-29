defmodule PhoenixApp.Auth.Guardian do
  @moduledoc false

  use Guardian, opt_app: :phoenix_app

  alias PhoenixApp.User

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    user = PhoenixApp.get(User, id)
    {:ok, user}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
