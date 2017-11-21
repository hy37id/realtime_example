use Mix.Config

# Configure database for test mode
config :realtime, Realtime.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "realtime_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
