defmodule ShardsOfOcarion.Repo.Migrations.AddChatIdToPlayers do
  use Ecto.Migration

  def change do
    alter table("players") do
      add(:chat_id, :integer, null: false)
    end

    create(index("players", :chat_id))
  end
end
