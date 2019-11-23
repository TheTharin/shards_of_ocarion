use Mix.Config

config :shards_of_ocarion, ecto_repos: [ShardsOfOcarion.Repo]

config :shards_of_ocarion, ShardsOfOcarion.Endpoint,
  url: [host: "localhost"],
  render_errors: [vie: ShardsOfOcarion.ErrorView, accepts: ~w(json)],
  pubsub: [name: ShardsOfOcarion.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console, format: "$time $metadata[$level] $message\n", metadata: [:request_id]

config :nadia, token: "993874669:AAHIynKGufRsdMCa_RBMfpoRfgytJ1G6PpA"
