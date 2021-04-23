defmodule Inmana.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Inmana.Repo,
      # Start the Telemetry supervisor
      InmanaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Inmana.PubSub},
      # Start the Endpoint (http/https)
      InmanaWeb.Endpoint,
      # Start a worker by calling: Inmana.Worker.start_link(arg)
      # {Inmana.Worker, arg}
      Inmana.Supplies.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options

    # strategy: :one_for_one, name: Restarta processos caso ocorra erros
    opts = [strategy: :one_for_one, name: Inmana.Supervisor]

    # Supervisor: Processo especial que supervisiona outros processos
    # Chama as funções start_link de todos os modulos que está na
    # É carregado na inicialização do servidor
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    InmanaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
