defmodule ShardsOfOcarion.Application do
  use Application

  alias ShardsOfOcarionWeb.Helpers.RouterHelper

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(ShardsOfOcarion.Repo, []),
      # Start the endpoint when the application starts
      supervisor(ShardsOfOcarionWeb.Endpoint, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShardsOfOcarion.Supervisor]

    # For Sentry to Capture errors from separate processes like Task
    # :ok = :error_logger.add_report_handler(Sentry.Logger)

    set_nadia_webhook()
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ShardsOfOcarionWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp set_nadia_webhook() do
    [{:url,
      "https://#{System.get_env("NGROK_URL")}/api/#{RouterHelper.normalized_token()}/receive_update"}]
    |> Nadia.set_webhook()
  end
end
