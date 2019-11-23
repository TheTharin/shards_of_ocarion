use Mix.Config

config :shards_of_ocarion, ecto_repos: [ShardsOfOcarion.Repo]

config :shards_of_ocarion, ShardsOfOcarionWeb.Endpoint,
  http: [port: 4222],
  url: [host: "localhost"],
  # render_errors: [view: ShardsOfOcarion.ErrorView, accepts: ~w(json)],
  pubsub: [name: ShardsOfOcarion.PubSub, adapter: Phoenix.PubSub.PG2],
  debug_errors: true,
  code_reloader: true,
  check_origin: false

config :logger, :console, format: "$time $metadata[$level] $message\n", metadata: [:request_id]

config :nadia, token: "993874669:AAHIynKGufRsdMCa_RBMfpoRfgytJ1G6PpA"

config :phoenix, :json_library, Jason
