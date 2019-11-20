defmodule ShardsOfOcarion.MixProject do
  use Mix.Project

  def project do
    [
      app: :shards_of_ocarion,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Phoenix Framework
      {:phoenix, "~> 1.4.9"},
      {:phoenix_pubsub, "~> 1.1.2"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_html, "~> 2.0"},
      {:plug_cowboy, "~> 2.0"},

      # PostgreSQL driver
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.14.3"},

      # GraphQL
      {:absinthe, "~> 1.4.16", override: true},
      {:absinthe_plug, "~> 1.4.7"},
      {:absinthe_ecto, "~> 0.1.3"},

      # Auth
      {:comeonin, "~> 4.0"},
      {:secure_random, "~> 0.5"},
      {:bcrypt_elixir, "~> 0.12"},
      {:guardian, "~> 1.0"},

      # JSON
      {:jason, "~> 1.1"},

      # HTTP Client
      {:hackney, "~> 1.15"}
    ]
  end
end
