defmodule ShardsOfOcarionWeb.ReceiveUpdateController do
  use ShardsOfOcarionWeb, :controller

  plug(:action)

  def create(conn, params) do
    IO.inspect(params)
  end
end
