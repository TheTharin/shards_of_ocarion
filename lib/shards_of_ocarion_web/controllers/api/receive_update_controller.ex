defmodule ShardsOfOcarionWeb.Api.ReceiveUpdateController do
  use ShardsOfOcarionWeb, :controller

  alias ShardsOfOcarionWeb.Handlers.UpdateHandler

  def create(conn, params) do
    params
    |> UpdateHandler.call()

    conn
    |> json(:ok)
  end
end
