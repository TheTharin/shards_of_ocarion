defmodule ShardsOfOcarionWeb.Senders.Errors do
  alias ShardsOfOcarion.Players.Player

  @spec already_signed_up(Player.t()) :: {:error, :already_signed_up}
  def already_signed_up(%Player{} = player) do
    text = "Вы уже зарегестрированы"

    ShardsOfOcarionWeb.Senders.TelegramSender.send_message(player.chat_id, text)

    {:error, :already_signed_up}
  end

  @spec could_not_sign_up(integer()) :: {:error, :could_not_sign_up}
  def could_not_sign_up(chat_id) do
    text = "Не получилось зарегистрироваться"

    ShardsOfOcarionWeb.Senders.TelegramSender.send_message(chat_id, text)

    {:error, :could_not_sign_up}
  end
end
