defmodule ShardsOfOcarionWeb.Router do
  use ShardsOfOcarionWeb, :router
  use Plug.ErrorHandler
  alias ShardsOfOcarionWeb.Helpers.RouterHelper

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:fetch_session)
  end

  scope "/api", ShardsOfOcarionWeb.Api do
    pipe_through(:api)

    resources("/#{RouterHelper.normalized_token()}/receive_update", ReceiveUpdateController, only: [:create])
  end
end
