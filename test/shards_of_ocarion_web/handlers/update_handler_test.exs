defmodule ShardsOfOcarionWeb.Handlers.UpdateHandlerTest do
  use ExUnit.Case, async: true

  import Mox

  alias ShardsOfOcarionWeb.Handlers.UpdateHandler

  setup :verify_on_exit!

  describe "when update is message" do
    test "#call/1 gets a user and invokes the message handler" do
      params = %{
        "message" => %{
          "chat" => %{"id" => 123, "username" => "Kek"},
          "message_id" => 123,
          "text" => "Kek"
        }
      }

      ShardsOfOcarionWeb.Senders.TelegramSenderMock
      |> expect(:delete_message, fn _a, _b -> nil end)

      ShardsOfOcarionWeb.Handlers.MessageHandlerMock
      |> expect(:call, fn _a, _b, _c, _d -> {:ok, :message_handled} end)

      assert UpdateHandler.call(params) == {:ok, :update_handled}
    end
  end

  describe "when update is not a message" do
    test "#call/1 returns {:error, unknown_update_type}" do
      assert UpdateHandler.call(%{"unknown_update" => "something"}) ==
               {:error, :unknown_update_type}
    end
  end
end
