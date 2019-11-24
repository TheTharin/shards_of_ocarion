defmodule ShardsOfOcarion.Repo do
  use Ecto.Repo,
    otp_app: :shards_of_ocarion,
    adapter: Ecto.Adapters.Postgres
end
