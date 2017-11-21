defmodule RealtimeAPI.Application do
  @moduledoc """
  The `RealtimeAPI` OTP Application definition. This is where the
  supervision tree for `RealtimeAPI` is defined.
  """

  @doc false
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link(
      [
        supervisor(Absinthe.Subscription, [RealtimeWeb.Endpoint]),
        worker(RealtimeAPI.PubSub.Repeater, [RealtimeWeb.Endpoint])
      ],
      strategy: :one_for_one,
      name: RealtimeAPI.Supervisor
    )
  end
end