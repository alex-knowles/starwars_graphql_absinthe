# Since configuration is shared in umbrella projects, this file
# should only configure the :web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :web,
  generators: [context_app: false]

config :web, Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9B1xcmVz3ZjcROqaTcTuwNJ+dsy3+FGf5+861wxoI7uqMagqrU5Sk2sBZT8Zk2vd",
  render_errors: [view: Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: Web.PubSub, adapter: Phoenix.PubSub.PG2]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
