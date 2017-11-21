use Mix.Config

config :realtime, ecto_repos: [Realtime.Repo]

config :realtime, Realtime.PubSub,
  adapter: Phoenix.PubSub.PG2,
  pool_size: 10

import_config "#{Mix.env()}.exs"
