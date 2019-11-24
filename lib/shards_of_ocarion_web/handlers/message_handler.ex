defmodule ShardsOfOcarionWeb.Handlers.MessageHandler do
  @callback call(Player.t() | tuple(), integer(), binary(), binary()) :: no_return()

  alias ShardsOfOcarion.Game.Flows.Player.SignUpFlow
  alias ShardsOfOcarion.Players.Player

  @spec call(Player.t(), binary()) :: any()
  def call(%Player{} = player, "/start") do
    ShardsOfOcarionWeb.Senders.Errors.already_signed_up(player)
  end

  def call(%Player{} = player, text) do
    # ShardsOfOcarion.Players.get_player(%{tg_nickname: user_name})
    # |> ShardsOfOcarion.Senders.Generic.send_greeting(chat_id)
  end

  @spec call(integer(), binary()) :: any()
  def call(chat_id, user_name) do
    SignUpFlow.call(chat_id, user_name)
  end

  def call(_, _, _, _) do
    {:ok, :message_handled}
  end
end
