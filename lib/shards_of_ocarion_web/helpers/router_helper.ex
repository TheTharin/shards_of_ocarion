defmodule ShardsOfOcarionWeb.Helpers.RouterHelper do
  def normalized_token() do
    Nadia.Config.token()
    |> String.replace(~r/(^.*:)/, "")
  end
end
