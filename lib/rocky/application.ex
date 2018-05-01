defmodule Rocky.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do

    {:ok, _} = Rox.open("./tmp/data.db", [create_if_missing: true])

    children = [
      {Plug.Adapters.Cowboy, scheme: :http, plug: Rocky.Router, options: [port: 4001]}
    ]

    opts = [strategy: :one_for_one, name: Rocky.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
