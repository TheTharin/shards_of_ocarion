defmodule ShardsOfOcarionWeb.Senders.Generic do
  alias ShardsOfOcarion.Players.Player
  @telegram_sender Application.get_env(:shards_of_ocarion, :tg_sender)

  def after_sign_up_message(%Player{} = user, chat_id) do
    # text = "Добро пожаловать в игру, #{user.tg_nickname}"

    # @telegram_sender.send_message(chat_id, text)

    # {:ok, :signed_up}
  end
end
