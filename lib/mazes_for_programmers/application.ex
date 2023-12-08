defmodule MazesForProgrammers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MazesForProgrammersWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:mazes_for_programmers, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MazesForProgrammers.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MazesForProgrammers.Finch},
      # Start a worker by calling: MazesForProgrammers.Worker.start_link(arg)
      # {MazesForProgrammers.Worker, arg},
      # Start to serve requests, typically the last entry
      MazesForProgrammersWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MazesForProgrammers.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MazesForProgrammersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
