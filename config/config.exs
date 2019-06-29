# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_app,
  ecto_repos: [PhoenixApp.Repo]

# Configures the endpoint
config :phoenix_app, PhoenixAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v76A4+W9lSqtSoS/sc+hzC23DmqBRh8LxGtRDAnnxGztaFbktxuFniGUd0bZmTsx",
  render_errors: [view: PhoenixAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Guardian
config :phoenix_app, PhoenixApp.Auth.Guardian,
  issuer: "phoenix_app",
  secret_key: "QnK5o/xYzYmi2CNSx1ki+t8rHiBz43ttuVmipNhPUirNgxZOru9xM1YIFC4I3WJw"

# Configure Authentication Pipeline
config :phoenix_app, PhoenixApp.Auth.AutheAccessPipeline,
  module: PhoenixApp.Auth.Guardian,
  error_handler: PhoenixApp.Auth.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
