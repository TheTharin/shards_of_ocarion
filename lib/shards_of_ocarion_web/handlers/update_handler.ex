defmodule ShardsOfOcarionWeb.Handlers.UpdateHandler do
  alias ShardsOfOcarion.Players
  alias ShardsOfOcarion.Players.Player

  @message_handler Application.get_env(:shards_of_ocarion, :message_handler)
  @telegram_sender Application.get_env(:shards_of_ocarion, :tg_sender)

  @spec call(map()) :: {:ok, :update_handled} | {:error, :unknown_update_type}
  def call(%{
        "message" => %{
          "chat" => %{"id" => chat_id, "username" => user_name},
          "message_id" => message_id,
          "text" => text
        }
      }) do
    delete_received_message(chat_id, message_id)
    handle_received_message(user_name, chat_id, text)
    {:ok, :update_handled}
  end

  def call(_) do
    {:error, :unknown_update_type}
  end

  @spec delete_received_message(integer(), integer()) :: {:ok, pid()}
  defp delete_received_message(chat_id, message_id) do
    Task.start(fn -> telegram_sender().delete_message(chat_id, message_id) end)
  end

  @spec telegram_sender() :: module()
  defp telegram_sender do
    @telegram_sender
  end

  @spec handle_received_message(binary(), integer(), binary()) :: {:ok, pid()}
  defp handle_received_message(user_name, chat_id, text) do
    with {:ok, player} <- Players.get_player(%{tg_nickname: user_name}),
         {:ok, player} <- Players.update_last_message_timestamp(player) do
      handle_message(player, user_name, chat_id, text)
    else
      err -> handle_message(err, user_name, chat_id, text)
    end
  end

  @spec handle_message(Player.t() | {:error, atom()}, binary(), integer(), binary()) ::
          {:ok, pid()}

  defp handle_message({:error, _}, user_name, chat_id, _) do
    Task.start(fn -> message_handler().call(user_name, chat_id) end)
  end

  defp handle_message(player, user_name, chat_id, text) do
    Task.start(fn -> message_handler().call(player, chat_id, user_name, text) end)
  end

  @spec message_handler() :: module()
  defp message_handler do
    @message_handler
  end
end
