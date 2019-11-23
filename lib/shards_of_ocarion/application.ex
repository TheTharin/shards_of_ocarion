defmodule ShardsOfOcarion.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      # supervisor(Quizzer.Repo, []),
      # Start Quantum scheduler when application starts
      # supervisor(Quizzer.Scheduler, []),
      # Start the endpoint when the application starts
      supervisor(ShardsOfOcarionWeb.Endpoint, [])
      # Start your own worker by calling: Quizzer.Worker.start_link(arg1, arg2, arg3)
      # worker(Quizzer.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShardsOfOcarion.Supervisor]

    # For Sentry to Capture errors from separate processes like Task
    # :ok = :error_logger.add_report_handler(Sentry.Logger)

    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ShardsOfOcarionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
