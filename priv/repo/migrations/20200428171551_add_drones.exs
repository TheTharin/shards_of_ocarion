defmodule ShardsOfOcarion.Repo.Migrations.AddDrones do
  use Ecto.Migration

  def change do
    create table(:drones) do
      add :name, :string, null: false
      add :type, :string, null: false
      add :health, :integer, null: false
      add :energy, :integer, null: false
      add :armor, :integer, null: false, default: 0
      add :accuracy, :integer, null: false, default: 50
      add :evasion, :integer, null: false, default: 0
      add :lowest_attack_power, :integer, null: false, default: 1
      add :highest_attack_power, :integer, null: false, default: 1
      add :crit_chance, :integer, null: false, default: 0
      add :speed, :integer, null: false, default: 1
      add :carrying_capacity, :integer, null: false


      timestamps()
    end
  end
end
