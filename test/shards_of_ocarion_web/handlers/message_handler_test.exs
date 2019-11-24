defmodule ShardsOfOcarionWeb.Handlers.MessageHandlerTest do
  use ExUnit.Case, async: true

  alias ShardsOfOcarion.Repo
  alias ShardsOfOcarionWeb.Handlers.UpdateHandler
  alias ShardsOfOcarionWeb.Handlers.MessageHandler

  describe "when player is not passed, but /start is passed as a message" do
    test "#call/2 invokes SignUpFlow" do
      assert MessageHandler.call("not_a_player", 1, "user", "/start") ==
               {:kek}
    end
  end

  # describe "when update is not a message" do
  #   test "#call/1 returns {:error, unknown_update_type}" do
  #     assert UpdateHandler.call(%{"unknown_update" => "something"}) == {:error, :unknown_update_type}
  #   end
  # end
end
