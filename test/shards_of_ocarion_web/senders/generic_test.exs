defmodule ShardsOfOcarionWeb.Senders.GenericTest do
  use ExUnit.Case, async: true

  import Mox

  alias ShardsOfOcarionWeb.Senders.Generic

  # setup :verify_on_exit!

  describe "when Player is provided" do
    # test "it sends an after_sign_up_message" do
    #   ShardsOfOcarionWeb.Senders.TelegramSenderMock
    #   |> expect(:send_message, fn 1, "Добро пожаловать в игру, Tharin", [] -> nil end)

    #   user = %ShardsOfOcarion.Players.Player{tg_nickname: "Tharin"}
    #   assert Generic.after_sign_up_message(user, 1) == {:ok, :signed_up}
    # end
  end
end
