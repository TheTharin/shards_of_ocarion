defmodule ShardsOfOcarion.Game.Flows.Player.SignUpFlowTest do
  use ExUnit.Case

  alias ShardsOfOcarion.Repo
  alias ShardsOfOcarion.Game.Flows.Player.SignUpFlow
  alias ShardsOfOcarion.Players
  alias ShardsOfOcarion.Players.Player

  setup do
    # Explicitly get a connection before each test
    # By default the test is wrapped in a transaction
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)

    # The :shared mode allows a process to share 
    # its connection with any other process automatically
    Ecto.Adapters.SQL.Sandbox.mode(Repo, { :shared, self() })
  end

  describe "when the player doesnt exist" do
    test "#call/3 creates a player" do
      SignUpFlow.call(1, "Tharin")
      assert Repo.one(Player).tg_nickname == "Tharin"
    end

    test "#call/3 returns {:ok, :signed_up}" do
      assert SignUpFlow.call(1, "Tharin") == {:ok, :signed_up}
    end
  end

  describe "when the player does exist" do
    setup [:create_player]

    defp create_player(_context) do
      Players.create_player(%{tg_nickname: "Tharin"})
      :ok
    end

    test "#call/3 returns {:error, :already_signed_up}" do
      assert SignUpFlow.call(1, "Tharin") == {:error, :already_signed_up}
    end
  end
end
