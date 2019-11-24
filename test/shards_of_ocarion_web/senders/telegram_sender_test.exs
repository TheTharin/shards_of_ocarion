defmodule ShardsOfOcarionWeb.Senders.TelegramSenderTest do
  use ExUnit.Case, async: false

  import Mox

  alias ShardsOfOcarionWeb.Senders.TelegramSender

  setup :verify_on_exit!

  describe "when everything is okay with telegram connection" do
    test "#send_message/3 sends a message using attached sender module" do
      ShardsOfOcarionWeb.NadiaMock
      |> expect(:send_message, fn 1, "kek", [] -> {:ok, :message_sent} end)

      TelegramSender.send_message(1, "kek")
    end

    test "#delete_message/2 deletes a message using attached sender module" do
      ShardsOfOcarionWeb.NadiaMock
      |> expect(:delete_message, fn 1, 1 -> {:ok, :message_deleted} end)

      TelegramSender.delete_message(1, 1)
    end
  end

  describe "when something is wrong" do
    test "#send_message/3 returns {:error, %Nadia.Model.Error{}}" do
      ShardsOfOcarionWeb.NadiaMock
      |> expect(:send_message, 5, fn 1, "/failed", [] ->
        {:error, %Nadia.Model.Error{__exception__: :something, reason: :connection_error}}
      end)

      TelegramSender.send_message(1, "/failed")
    end

    test "#delete_message/2 returns {:error, %Nadia.Model.Error{}}" do
      ShardsOfOcarionWeb.NadiaMock
      |> expect(:delete_message, 5, fn 1, 1 ->
        {:error, %Nadia.Model.Error{__exception__: :something, reason: :connection_error}}
      end)

      TelegramSender.delete_message(1, 1)
    end
  end
end
