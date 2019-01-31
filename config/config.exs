# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :file_upload,
  ecto_repos: [FileUpload.Repo]

# Configures the endpoint
config :file_upload, FileUpload.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Krc79IUIcvB+gjwIrU7ehaG6+IH6mEOQHRkp23pdaVqDXjz5+e7BmWlX+R1C78Kd",
  render_errors: [view: FileUpload.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FileUpload.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
