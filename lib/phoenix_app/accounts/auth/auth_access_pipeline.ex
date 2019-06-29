defmodule PhoenixApp.Auth.AuthAccessPipeline do
  @moduledoc false

  use Guardian.Plug.Pipeline,
    otp_app: :phoenix_app,
    error_handler: PhoenixApp.Auth.AuthErrorHandler

  plug(Guardian.Plug.Pipeline,
    module: PhoenixApp.Guardian,
    error_handler: PhoenixApp.Auth.AuthErrorHandler
  )

  # plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  # plug(Guardian.Plug.EnsureAuthenticated)
  # plug(Guardian.Plug.LoadResource)
end
