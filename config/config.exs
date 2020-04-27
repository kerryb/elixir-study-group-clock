# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :clock,
  ecto_repos: [Clock.Repo]

# Configures the endpoint
config :clock, ClockWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kCOmtYM6es7B/23wL6zTSVRVKc6Qjo08zpmZkTQN7sYmcs5Lj1BAPhXvjdNWeALB",
  render_errors: [view: ClockWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Clock.PubSub,
  live_view: [signing_salt: "L2LSHm+/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
