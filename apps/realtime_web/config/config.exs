# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :realtime_web,
  ecto_repos: [Realtime.Repo],
  generators: [context_app: :realtime]

# Configures the endpoint
config :realtime_web, RealtimeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base:
    "D2JkPXMTGfECaq/BiyspSkOPVDGMZ6RpLvHxLdtLj87jKqtKrpBOvY2bYDbb5zkuJ25dw0+8sOzg9fUu0rXjGg==",
  render_errors: [view: RealtimeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Realtime.PubSub]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"