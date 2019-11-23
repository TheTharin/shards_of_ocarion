defmodule ShardsOfOcarionWeb.Router do
  use ShardsOfOcarionWeb, :router
  use Plug.ErrorHandler

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:protect_from_forgery)
  end

  scope "/", ShardsOfOcarionWeb do
    pipe_through(:api)
    post("/receive_update", ReceiveUpdateController, :create, as: :receive_update)
  end
end
