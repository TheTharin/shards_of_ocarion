defmodule ShardsOfOcarion.Repo.Migrations.AddStatusMessagesAndLastMessageDateToPlayers do
  use Ecto.Migration

  def change do
    alter table("players") do
      add(:bot_status_message_id, :integer, null: true)
      add(:bot_response_message_id, :integer, null: true)
      add(:last_player_message_at, :naive_datetime, null: true)
    end

    create(index("players", [:bot_status_message_id, :id]))
    create(index("players", [:bot_response_message_id, :id]))
    create(index("players", [:last_player_message_at, :id]))
  end
end
