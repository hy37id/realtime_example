use Mix.Config

# Configure your database
config :realtime, Realtime.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "realtime_dev",
  hostname: "localhost",
  pool_size: 10
