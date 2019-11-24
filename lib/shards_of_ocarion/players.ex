defmodule ShardsOfOcarion.Players do
  alias ShardsOfOcarion.Players.Player

  @spec get_player(map()) :: {:ok, Player.t()} | {:error, :player_not_found}
  def get_player(%{tg_nickname: _} = params) do
    case ShardsOfOcarion.Players.Player.Repository.get_player_by(params) do
      %Player{} = player -> {:ok, player}
      _ -> {:error, :player_not_found}
    end
  end

  @spec create_player(map()) :: {:ok, Player.t()} | {:error, :atom}
  def create_player(%{tg_nickname: _} = params) do
    ShardsOfOcarion.Players.Player.Repository.create_player(params)
  end

  @spec update_last_message_timestamp(Player.t()) :: {:ok, Player.t()} | {:error, :atom}
  def update_last_message_timestamp(%Player{} = player) do
    ShardsOfOcarion.Players.Player.Repository.update_player(
      player,
      %{last_player_message_at: NaiveDateTime.utc_now()}
    )
  end
end
