use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :drag_time_api, DragTimeApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "drag_time_api_test",
  hostname: System.get_env("DB_HOST", "localhost"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :drag_time_api, DragTimeApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Bcrypt configuration 
config :bcrypt_elixir, :log_rounds, 4
