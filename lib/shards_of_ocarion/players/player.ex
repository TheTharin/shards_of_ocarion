defmodule ShardsOfOcarion.Players.Player do
  use Ecto.Schema

  import Ecto.Changeset
  import ShardsOfOcarion.General.Helpers.ChangesetHelper
  alias ShardsOfOcarion.Players.Player

  @type t :: %__MODULE__{}

  schema "players" do
    field(:tg_nickname, :string)
    field(:bot_status_message_id, :integer)
    field(:bot_response_message_id, :integer)
    field(:last_player_message_at, :naive_datetime)
    field(:chat_id, :integer)

    timestamps()
  end

  @doc """
  Builds a changeset for user creation.
  """
  @required_fields [:tg_nickname]
  @spec create_changeset(Player.t(), map()) :: struct()
  def create_changeset(%Player{} = struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:tg_nickname)
  end

  @doc """
  Builds a changeset for updating user. Filters out `nil` params.
  """
  @optional_fields [:bot_status_message_id, :bot_response_message_id, :last_player_message_at]
  @spec update_changeset(Player.t(), map()) :: struct()
  def update_changeset(%Player{} = player, params \\ %{}) do
    params =
      params
      |> Enum.reject(fn {_, v} -> is_nil(v) end)
      |> Map.new()

    player
    |> cast(params, @optional_fields)
    |> validate_current_or_past_datetime(:last_player_message_at)
  end
end
