defmodule FoodTruckTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FoodTruckTrackerWeb.Telemetry,
      FoodTruckTracker.Repo,
      {DNSCluster,
       query: Application.get_env(:food_truck_tracker, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FoodTruckTracker.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FoodTruckTracker.Finch},
      # Start a worker by calling: FoodTruckTracker.Worker.start_link(arg)
      # {FoodTruckTracker.Worker, arg},
      # Start to serve requests, typically the last entry
      FoodTruckTrackerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FoodTruckTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodTruckTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
