defmodule ShardsOfOcarion.Repo.Migrations.AddPlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :tg_nickname, :string, null: false

      timestamps()
    end

    create unique_index(:players, [:tg_nickname])
  end
end
