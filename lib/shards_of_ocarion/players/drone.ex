defmodule ShardsOfOcarion.Players.Drone do
  use Ecto.Schema

  import Ecto.Changeset

  schema "drones" do
    field :type, :string
    field :health, :integer
    field :energy, :integer
    field :armor, :integer
    field :accuracy, :integer
    field :evasion, :integer
    field :lowest_attack_power, :integer
    field :highest_attack_power, :integer
    field :crit_chance, :integer
    field :speed, :integer
    field :carrying_capacity, :integer

    timestamps()
  end

  @doc false
  @required_fields [:type]
  def create_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:tg_nickname)
  end
end
