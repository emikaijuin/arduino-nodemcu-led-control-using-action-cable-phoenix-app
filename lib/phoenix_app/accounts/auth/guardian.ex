defmodule PhoenixApp.Auth.Guardian do
  @moduledoc false

  use Guardian, opt_app: :phoenix_app

  alias PhoenixApp.User

  def subject_for_token(user, _claims) do
    {:ok, user.email}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    email = claims["sub"]
    user = PhoenixApp.get_by(User, email: email)
    {:ok, user}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
