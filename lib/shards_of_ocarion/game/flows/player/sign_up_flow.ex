defmodule ShardsOfOcarion.Game.Flows.Player.SignUpFlow do
  @behaviour ShardsOfOcarion.Game.FlowBehaviour

  alias ShardsOfOcarion.Players
  alias ShardsOfOcarion.Game.FlowBehaviour

  @impl FlowBehaviour
  def call(chat_id, user_name) do
    case Players.create_player(%{tg_nickname: user_name}) do
      {:ok, player} ->
        ShardsOfOcarionWeb.Senders.Generic.after_sign_up_message(player, chat_id)

      _ ->
        ShardsOfOcarionWeb.Senders.Errors.could_not_sign_up(chat_id)
    end
  end
end
