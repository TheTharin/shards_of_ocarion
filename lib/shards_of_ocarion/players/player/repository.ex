defmodule ShardsOfOcarion.Players.Player.Repository do
  @moduledoc false

  # import Ecto.Query
  import Ecto.Changeset, warn: false

  alias ShardsOfOcarion.Repo
  alias ShardsOfOcarion.Players.Player

  @spec get_player(integer()) :: {:ok, Player.t()} | {:error, any()}
  def get_player(id) do
    Repo.get(Player, id)
  end

  @spec get_player!(integer()) :: Player.t() | nil
  def get_player!(id) do
    Repo.get!(Player, id)
  end

  @spec get_player_by(map()) :: Player.t() | nil
  def get_player_by(params) do
    Repo.get_by(Player, params)
  end

  @spec update_player(Player.t(), map()) :: {:ok, Player.t()} | {:error, any()}
  def update_player(%Player{} = player, params) do
    player
    |> Player.update_changeset(params)
    |> Repo.update()
  end

  @spec list_players() :: [Player.t()]
  def list_players do
    Repo.all(Player)
  end

  @spec create_player(map()) :: {:ok, Player.t()} | {:error, any()}
  def create_player(params) do
    %Player{}
    |> Player.create_changeset(params)
    |> Repo.insert()
  end
end
