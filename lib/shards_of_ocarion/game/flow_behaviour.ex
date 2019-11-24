defmodule ShardsOfOcarion.Game.FlowBehaviour do
  @callback call(integer(), binary()) :: {:ok, atom()} | {:error, term()}
end
