defmodule Realtime.Application do
  @moduledoc """
  The `Realtime` OTP Application definition. This is where the
  supervision tree for `Realtime` is defined.
  """

  use Application

  @doc false
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link(
      [
        supervisor(Realtime.Repo, []),
        Realtime.PubSub
      ],
      strategy: :one_for_one,
      name: Realtime.Supervisor
    )
  end
end