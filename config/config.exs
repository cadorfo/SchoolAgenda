# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :school_agenda,
  ecto_repos: [SchoolAgenda.Repo]

# Configures the endpoint
config :school_agenda, SchoolAgenda.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lwzvTDh3rlcJzXZ2/3woOo0gMu9jyfLrybN2clq88K54sVkpfoOScQyL5ExKf7bl",
  render_errors: [view: SchoolAgenda.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SchoolAgenda.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
    providers: [
      google: {Ueberauth.Strategy.Google, []}
    ]


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
